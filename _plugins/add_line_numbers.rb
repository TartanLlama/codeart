require 'nokogiri'
Jekyll::Hooks.register(:pages, :post_render) do |page|
  doc = Nokogiri::HTML(page.output)
  count = 0
  doc.css('#main p').each do |node|
    old_parent = node.parent
    parent = doc.create_element("div", :class => 'txt-line')
    old_parent.add_child(parent)
    parent.add_child(doc.create_element("div", count, :class => 'line-num'))
    node.unlink
    parent.add_child(node)
    count += 1
end

    page.output = doc.to_html
end