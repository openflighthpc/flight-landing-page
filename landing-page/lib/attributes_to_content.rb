class AttributesToContent < Nanoc::Filter
  identifier :attributes_to_content

  def run(content, item:)
    item.attributes.dup
  end
end
