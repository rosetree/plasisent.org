# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering
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

