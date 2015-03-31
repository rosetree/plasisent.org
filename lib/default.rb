# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo


def generate_url base, title
  title = title.gsub /[ äöüß#]/, ' ' => '-', 'ä' => 'ae', 'ö' => 'oe', 'ü' => 'ue', 'ß' => 'ss', '#' => 'hashtag-'
  title = title.downcase
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
    linked_tags << link_to(tag, generate_url('/themen/', tag))
  end
  linked_tags.join ', '
end


def move_post_identifiers
  @items.each do |item|
    item.identifier = item.identifier.gsub /(201[0-9]\/)\d{3}-/, "\\1"
  end
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
  class Item
    def github_url
      return "" unless self[:content_filename]
      "https://github.com/rosetree/plasisent.org/blob/master/#{self[:content_filename]}"
    end


    def linked_date_information
      return "" unless self[:created_at]

      date = self[:created_at]

      year  = date.strftime "%Y"
      month = german_month_name date
      day   = date.strftime "%-d"

      year_link = link_to year, "/#{year}/"
      week_link = link_to "Woche #{date.strftime("%-V")}", "/#{year}/kw-#{date.strftime("%V")}/"

      "#{day}. #{month} (#{year_link}, #{week_link})"
    end
  end
end
