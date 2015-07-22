module Plasisent

  # TODO: Write some documentation.
  class AddFigureToIMGFilter < Nanoc::Filter
    requires "nokogiri"

    identifier :add_figure_to_img

    def run(content, params={})
      doc = Nokogiri::HTML::DocumentFragment.parse content

      doc.css("img").each do |img|
        next if img.parent.matches? "figure"
        next if img.parent.matches? "a" and img.parent.parent.matches? "figure"

        # If the <img> is surrounded by a link, that link should be the wrapped
        # inside the figure. Otherwise the <figure> and <figcaption> are
        # wrapped inside a link, causing HTML validation to fail.
        figure_child = if img.parent.matches? "a"
                         img.parent
                       else
                         img
                       end

        figure = Nokogiri::XML::Node.new "figure", doc
        figure_child.add_next_sibling figure
        figure_child.parent = figure

        caption = Nokogiri::XML::Node.new "figcaption", doc
        caption.content = img["alt"]
        caption.parent = figure

        # Prevent <figure> from being wrapped inside a paragraph.
        if figure.parent.matches? "p"
          parent_p = figure.parent
          parent_p.add_next_sibling figure
          parent_p.unlink
        end
      end

      doc.to_html
    end

  end

end
