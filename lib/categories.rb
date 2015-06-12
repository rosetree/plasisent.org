include Nanoc::Helpers::Blogging

# TODO: Write documentation. (See git log.)

module Nanoc
  class Item
    def category?
      if self[:kind] && self[:kind] == "category"
        true
      else
        false
      end
    end

    def has_category?(category = "default")
      if self[:category] && self[:category] == category
        true
      else
        false
      end
    end
  end
end


module Category
  extend Nanoc::Memoization

  def all_items_with_category
    return [] unless @item[:kind] == "category"
    return [] unless @item[:tags]

    category_items = []

    sorted_articles.each do |article|
      next unless article[:tags]

      article[:tags].each do |article_tag|
        # TODO: next in parent loop?
        next if category_items.include? article
        next unless @item[:tags].include? article_tag

        category_items << article
      end
    end

    category_items
  end
  memoize :all_items_with_category

  def all_categories
    categories = []
    @items.each do |item|
      next unless item.category?
      categories << item
    end
    categories
  end
  memoize :all_categories
end

include Category
