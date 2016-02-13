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


def link_category(item)
  link_to_category = ""
  all_categories.each do |cat|
    next unless item.has_category? cat[:name] || cat[:title]
    link_to_category = link_to cat[:title], cat.path
  end
  return link_to_category
end


def link_tags(item, tag_attribute = :tags)
  linked_tags = []
  item[tag_attribute].map do |tag|
    linked_tags << link_to(tag, generate_url('/themen/', tag), {rel: "tag"})
  end
  linked_tags.join ', '
end


def link_categories(item, category_attribute = :categories)
  linked_cats = []
  item[category_attribute].map do |category|
    next unless category.is_a? Nanoc::Item
    linked_cats << link_to(category[:title], category, {rel: "category"})
  end
  linked_cats.join ', '
end


def move_post_identifiers
  @items.each do |item|
    item.identifier = item.identifier.gsub /(201[0-9]\/)\d{3}-/, "\\1"
  end
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

##
# FIXME: Generating prev and next links is very (!) slow.
#
def generate_prev_next_links
  yearly_archives = @items.find_all do |i|
    # The archives identifier end with `YEAR/`. That’s why we check agains four
    # digits and a slash at the end of an item with the kind of an archive.
    i[:kind] == "archive" and i.identifier =~ /\d{4}\/$/
  end

  weekly_archives = @items.find_all do |i|
    # The archives identifier end with `-WEEK_NUMBER/`. That’s why we check
    # agains a dash, two digits and a slash at the end of an item with the kind
    # of an archive.
    i[:kind] == "archive" and i.identifier =~ /-\d{2}\/$/
  end

  yearly_archives.sort! { |a,b| a[:created_at] <=> b[:created_at] }
  weekly_archives.sort! { |a,b| a[:created_at] <=> b[:created_at] }

  collections = {
    yearly_archives: yearly_archives,
    weekly_archives: weekly_archives,
    # The `sorted_articles` array is ordered by creation date, newest articles
    # come first. So we need to reverse that.
    sorted_articles: sorted_articles.reverse,
  }

  # We don’t care for the key, so use each value.
  collections.each_value do |collected_items|
    # We’re using `each_index` to look around in the array.
    collected_items.each_index do |i|
      item = collected_items[i]

      if i > 0
        item[:prev] = collected_items[i - 1]
      end

      if i < collected_items.size - 1
        item[:next] = collected_items[i + 1]
      end
    end
  end
end


def german_month_name date
  german_months = ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli",
                   "August", "September", "Oktober", "November", "Dezember"]
  german_months[date.strftime("%m").to_i - 1]
end


module Nanoc
  module Helpers::Blogging
    # TODO: Contribute to https://github.com/nanoc/nanoc
    def attribute_to_time(time)
      time = time.to_time if time.is_a?(DateTime)
      time = Time.local(time.year, time.month, time.day) if time.is_a?(Date)
      time = Time.parse(time) if time.is_a?(String)
      time
    end
  end

  class Item
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
