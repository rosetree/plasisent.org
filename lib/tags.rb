module PlasisentTags
  extend Nanoc::Memoization

  # Collect all tags from articles
  #
  # :call-seq:
  #   all_tags(array) -> array
  #   all_tags(array, posts) -> array
  #
  # By default all posts are scanned. Add a collection to limit the
  # posts scanned. The items in the array are Nanoc::Items where the
  # +kind+ is +article+
  #
  # Returns an array of strings with the name of tags on those posts.
  def all_tags(posts=@items)
    tags = []
    posts.each do |article|
      next if article[:tags].nil?
      tags << article[:tags]
    end
    tags.flatten.compact.uniq
  end
  memoize :all_tags

  # Check if a given article has a tag
  #
  # :call-seq: has_tag?(tag, article) -> boolean
  def has_tag?(tag, article)
    if article[:tags].nil?
      false
    else
      article[:tags].include?(tag)
    end
  end

  # Find all articles with a specific tag.
  #
  # :call-seq:
  #   articles_with_tag(tag) -> array
  #   articles_with_tag(tag, posts) -> array
  #
  # By default all articles are checked. Pass in an array to limit the
  # search to a subset of articles.
  def articles_with_tag(tag, posts=@items)
    posts.select { |article| has_tag?(tag, article) }
  end
  memoize :articles_with_tag

  # Collect all articles and return them in sub-arrays by tag.
  #
  # :call-seq:
  #   articles_by_tag -> [tag, array]
  #   articles_by_tag(posts) -> [tag, array]
  #
  # By default all articles are checked. Pass in an array to limit the
  # search to a subset of articles.
  def articles_by_tag(posts=@items)
    tags = []
    all_tags.each do |tag|
      tags << [tag, articles_with_tag(tag)]
    end
    tags
  end
  memoize :articles_by_tag

  # Create individual pages for each tag under root/tags.
  #
  # There's no way to know in advance what tags the blog will have.
  # Instead of creating pages beforehand, we hook into the +preprocess+
  # method to run this method.
  #
  # The method gathers all tags and their accompanying articles,
  # creates a page for each tag and lists the articles for it. Each
  # article is added to nanoc's +@items+ array for further processing.
  def create_tag_pages
    articles_by_tag.each do |tag, posts|
      tag_url  = generate_url '/themen/', tag
      tag_item = @items.select { |i| i.identifier == tag_url }
      if tag_item == []
        @items << Nanoc::Item.new(
          "",
          {
            :title => "Stichwort „#{tag}“",
            :posts => posts.sort_by! { |a| attribute_to_time(a[:created_at]) }.reverse,
            :kind => 'tag'
          },
          tag_url
        )
      else
        tag_item[0][:posts] = posts
        tag_item[0][:kind] = 'tag'
      end
    end
  end
end

include PlasisentTags
