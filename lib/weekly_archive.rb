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

      linkprev = nil
      linknext = nil

      if (wi > 0)
        linkprev = { :title => "#{title} #{weeklist[wi - 1]}", :link => "/#{year}/#{week_url_prefix}#{weeklist[wi - 1]}/" }
      end

      if (wi < weeklist.size - 1)
        linknext = { :title => "#{title} #{weeklist[wi + 1]}", :link => "/#{year}/#{week_url_prefix}#{weeklist[wi + 1]}/" }
      end

      @items << Nanoc::Item.new(
        "",
        {
          :title => "#{title} #{week}",
          :kind => "archive",
          :posts => weekmap[week],
          :linkprev => linkprev,
          :linknext => linknext,
          :referenced_tags => articles_tags
        },
        "/#{year}/#{week_url_prefix}#{week}/")
    end
  end
end
