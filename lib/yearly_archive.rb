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
def generate_yearly_archive(articles, date_attribute, title)
  today = Time.now
  currentyear = today.year
  yearmap = articles.group_by { |item| item[date_attribute].year }

  if !yearmap.has_key?(currentyear)
    yearmap[currentyear] = []
  end

  yearlist = yearmap.keys.sort

  yearlist.each_index do |i|
    year = yearlist[i]
    yearmap[year].sort! { |a,b| b[date_attribute].to_datetime <=> a[date_attribute].to_datetime }

    @items << Nanoc::Item.new(
      "",
      {
        :title => "#{title} #{year}",
        :kind => "archive",
        :posts => yearmap[year],
      },
      "/#{year}/")
  end
end
