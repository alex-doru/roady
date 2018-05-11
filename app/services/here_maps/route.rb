class HereMaps::Route
  def initialize(xml)
    @xml = xml
  end

  def link_ids
    xml_object = Nokogiri::XML(@xml)
    ids = xml_object.xpath("//LinkId").map do |link_node|
      link_node.children.first.text.to_i
    end
    ids
  end

  def request_ready_link_ids
    link_ids.join(';')
  end
end
