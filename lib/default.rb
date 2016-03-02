# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Text


def generate_url base, title
  title = title.downcase.gsub /[ äÄöÖüÜß#„“]/ do |match|
    case match
    when " " then "-"
    when "ä" then "ae"
    when "Ä" then "ae"
    when "ö" then "oe"
    when "Ö" then "oe"
    when "ü" then "ue"
    when "Ü" then "ue"
    when "ß" then "ss"
    when "#" then "hashtag-"
    # Some chars have to be removed.
    when "„", "“", ".", ",", "!", "?"
      ""
    end
  end
  return "#{base}#{title}/"
end

# TODO: Document load_snippet.
def load_snippet name
  snippet = generate_url "/snippets/", name

  unless @items[snippet]
    $stderr.puts "Snippet warning: #{snippet} doesn’t exist."
    return ""
  end

  @items[snippet].compiled_content
end

def snippet_for_title name
  strip_html(nl_to_space(load_snippet(name))).strip
end

def nl_to_space text
  text.gsub(/(\r\n?|\n)/, " ")
end

def german_month_name date
  german_months = ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli",
                   "August", "September", "Oktober", "November", "Dezember"]
  german_months[date.strftime("%m").to_i - 1]
end


module Nanoc
  class ItemWithRepsView
    def title
      if self[:title]
        "#{self[:title]} · Plasisent"
      else
        'Plasisent'
      end
    end

    def reply_to_mailto_link
      unless self[:author_email]
        return 'keine E-Mailadresse'
      end

      e = self[:author_email]
      s = "Re: #{self.title}"
      c = "Shalömchen und Moin Moin"
      l = "mailto:#{e}?subject=#{s}&amp;content=#{c}"

      link_to e, l, {rel: 'reply-to'}
    end

    def github_url base = ''
      return "" unless self[:content_filename]

      case base
      when 'history'
        "https://github.com/rosetree/plasisent.org/commits/master/#{self[:content_filename]}"
      else
        "https://github.com/rosetree/plasisent.org/blob/master/#{self[:content_filename]}"
      end
    end

    def base_36_code
      date = attribute_to_time self[:created_at]

      if self[:base_36_code]
        return self[:base_36_code]
      end

      unless date
        return nil # TODO: Throw an error / warning?
      end

      # Special handling for year and time
      #
      # To save a character, I’m going to assume, we have write all articles in
      # the 2000 millenium.
      year = (date.year - 2000)
      # This is smaller, than using base 36 versions of each, and I don’t
      # think, my blog is going to need a hackable time url.
      time = "#{date.hour}#{date.min}#{date.sec}".to_i

      # Create short identifier with base 36
      code =              year.to_s(36).rjust(2, "0")
      code = code + date.month.to_s(36)
      code = code +   date.day.to_s(36)
      code = code +       time.to_s(36).rjust(4, "0")

      return code
    end

    def shortlink
      return nil unless self.base_36_code
      # Check if the shortlink is shorter than the long link.
      return nil if self.path.length <= self.base_36_code.length
      # We use File.join to make sure there is a slash between domain and page
      # TODO: Make the domain configurable
      File.join('http://plasisent.org/', self.base_36_code)
    end

    def linked_date_information
      return "" unless self[:created_at]

      date = self[:created_at]

      year  = date.strftime "%Y"
      wyear = date.strftime "%G"
      month = german_month_name date
      day   = date.strftime "%-d"

      year_link = link_to year, "/#{year}/"
      week_text = "Woche #{date.strftime("%-V in %G")}"
      week_link = link_to week_text, "/#{wyear}/kw-#{date.strftime("%V")}/"
      time_text = "#{day}. #{month} #{year_link} (#{week_link})"

      "<time datetime='#{date.iso8601}'>#{time_text}</time>"
    end
  end
end
