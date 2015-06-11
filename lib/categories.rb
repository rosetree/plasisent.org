
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

  def all_items_with_category(category = "default")
    category_items = []

    @items.each do |item|
      next unless item.has_category? category
      category_items << item
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
