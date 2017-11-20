# coding: utf-8
# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Text

def generate_url base, title
  title = title.downcase.gsub(/[ äÄöÖüÜß#„“]/) do |match|
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
  return "#{base}#{title}.*"
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

def page_title
  @item[:title] ? "#{@item[:title]} · Plasisent" : 'Plasisent'
end

def page_github_url(base = '')
  return '' unless @item[:content_filename]

  case base
  when 'history'
    "https://github.com/rosetree/plasisent.org/commits/master/#{@item[:content_filename]}"
  else
    "https://github.com/rosetree/plasisent.org/blob/master/#{@item[:content_filename]}"
  end
end

def reply_to_mailto_link
  return 'keine E-Mailadresse' unless @item[:author_email]

  e = @item[:author_email]
  s = "Re: #{@item[:title]}"
  c = "Shalömchen und Moin Moin"
  l = "mailto:#{e}?subject=#{s}&amp;content=#{c}"

  link_to e, l, {rel: 'reply-to'}
end

# base_36_code returns the :base_36_code attribute of the current
# item. If this is nil, it creates an unique code, based on the items
# publication date and time.
#
# Special handling for year and time:
# 1. To save a character, I’m going to assume, that all articles are
# written in the 2000 millenium.
# 2. Concatenating hours, minutes and seconds as string and turning
# the resulting number into its base 36 representation is shorter than
# base 36 of each individual. Drawback: The time code is not hackable.
#
# TODO: What if the item has no date? Raise an error? Returns nil at
# the moment.
def base_36_code(item = @item)
  return item[:base_36_code] if item[:base_36_code]

  date = attribute_to_time(item[:created_at])
  return nil unless date

  year = date.year - 2000
  time = "#{date.hour}#{date.min}#{date.sec}".to_i

  code = year.to_s(36).rjust(2, "0")
  code = code + date.month.to_s(36)
  code = code + date.day.to_s(36)
  code = code + time.to_s(36).rjust(4, "0")

  return code
end

def page_shortlink
  return nil unless base_36_code
  # Check if the shortlink is shorter than the long link.
  return nil if @item.path.length <= base_36_code.length
  # We use File.join to make sure there is a slash between domain and page
  # TODO: Make the domain configurable
  File.join('http://plasisent.org/', base_36_code)
end

def linked_date_information(item = @item)
  return "" unless item[:created_at]

  date = item[:created_at]

  year  = date.strftime "%Y"
  month = german_month_name date
  day   = date.strftime "%-d"
  time  = date.strftime "%-k:%M"

  year_link = link_to year, "/#{year}/"
  time_text = "#{day}. #{month} #{year_link} (#{time} Uhr)"

  "<time datetime='#{date.iso8601}'>#{time_text}</time>"
end
