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

  def preprocess_categories
    all_categories.each do |cat|
      create_category_feed(cat, all_items_with_category(cat))
    end
  end

  def all_items_with_category category = @item
    return [] unless category[:kind] == "category"
    return [] unless category[:tags]

    category_items = []

    sorted_articles.each do |article|
      next unless article[:tags]

      article[:tags].each do |article_tag|
        # TODO: next in parent loop?
        next if category_items.include? article
        next unless category[:tags].include? article_tag

        category_items << article

        # Before the representations of an item get build, all site data will
        # be frozen and thus cannot be changed. Freezing the site data is the
        # preprocessors last step.
        #
        # See also: https://github.com/nanoc/nanoc/wiki/The-Compilation-Process
        if category.reps == []
          if article[:categories] == nil
            article[:categories] = []
          end

          article[:categories] << category
        end
      end
    end

    category_items
  end
  memoize :all_items_with_category

  def create_category_feed category, feed_articles = []
    return nil unless category[:kind] == "category"
    return nil if feed_articles.count == 0

    feed_identifier = "/feed#{category.identifier}"

    @items << Nanoc::Item.new(
      "<%= atom_feed({ title: '#{category[:title]} | #{@config[:title]}', articles: @item[:feed_articles] }) %>",
      { feed_articles: feed_articles },
      feed_identifier
    )

    category[:feed] = @items[feed_identifier]
  end

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
