# Please note (no pun intended), this code is copied and slightly adapted from
# the Nanoc::Helper::Blogging

module Plasisent
  module Posting
    def post_kinds
      ['article', 'note']
    end

    def posts
      blk = -> { @items.select { |item| post_kinds.include? item[:kind] } }

      if @items.frozen?
        @post_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_posts
      blk = -> { posts.sort_by { |a| attribute_to_time(a[:created_at]) }.reverse }

      if @items.frozen?
        @sorted_post_items ||= blk.call
      else
        blk.call
      end
    end

    def link_to_prev_post(post)
      return nil unless post_kinds.include? post[:kind]

      index = sorted_posts.index(post)
      return nil if index + 1 == sorted_posts.length

      previous = sorted_posts[index + 1]
      return link_to previous[:title], previous, {rel: 'prev'}
    end

    def link_to_next_post(post)
      return nil unless post_kinds.include? post[:kind]

      index = sorted_posts.index(post)
      return nil if index == 0

      next_post = sorted_posts[index - 1]
      return link_to next_post[:title], next_post, {rel: 'next'}
    end

    module Noting
      def notes
        blk = -> { @items.select { |item| item[:kind] == 'note' } }

        if @items.frozen?
          @note_items ||= blk.call
        else
          blk.call
        end
      end

      def sorted_notes
        blk = -> { notes.sort_by { |a| attribute_to_time(a[:created_at]) }.reverse }

        if @items.frozen?
          @sorted_note_items ||= blk.call
        else
          blk.call
        end
      end

      def notes_atom_feed(params = {})
        params[:articles] = notes
        atom_feed params
      end
    end
  end
end


include Plasisent::Posting
include Plasisent::Posting::Noting
