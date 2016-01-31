# Original Source:
#   https://github.com/cccs/cccs-website/blob/master/lib/yearlyarchive.rb
#
# Original Author:
#   Stefan Schlott
#   https://github.com/Skyr
#
# Original Licence:
#   CC BY-SA 3.0
#   http://creativecommons.org/licenses/by-sa/3.0/
#
def generate_weekly_archive(articles, date_attribute, title, week_url_prefix = "kw-")
  today = Time.now
  currentyear = today.year

  # FIXME: It shouldn’t be necessary to check type of the date_attribute here.
  articles.each do |item|
    if item[date_attribute].is_a? String
      item[date_attribute] = DateTime.parse(item[date_attribute])
    end
  end

  yearmap = articles.group_by { |item| item[date_attribute].year }

  if !yearmap.has_key?(currentyear)
    yearmap[currentyear] = []
  end

  yearlist = yearmap.keys.sort

  yearlist.each_index do |i|
    year = yearlist[i]

    weekmap = yearmap[year].group_by { |item| item[date_attribute].strftime("%V") }

    weeklist = weekmap.keys.sort

    weeklist.each_index do |wi|
      week = weeklist[wi]

      weekmap[week].sort! { |a,b| b[date_attribute].to_datetime <=> a[date_attribute].to_datetime }

      articles_tags = []
      weekmap[week].each do |a|
        articles_tags << a[:tags] if a[:tags]
      end
      articles_tags = articles_tags.flatten.compact.uniq

      @items << Nanoc::Item.new(
        "",
        {
          # TODO: Make title more configurable.
          #   http://ruby-doc.org/core-2.3.0/String.html#method-i-25
          :title => "#{year} #{title} #{week}",
          :kind => "archive",
          :posts => weekmap[week],
          :referenced_tags => articles_tags
        },
        "/#{year}/#{week_url_prefix}#{week}/")
    end
  end
end


def last_week_archive
  week_archives = @items.find_all { |i| i[:kind] == "archive" }
  week_archives.last
end
