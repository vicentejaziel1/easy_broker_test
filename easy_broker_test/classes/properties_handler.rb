require 'json'

class PropertiesHandler
  attr_accessor :raw_properties
  def initialize(raw_properties)
    @raw_properties = JSON.parse(raw_properties)
  end

  def get_titles
    raw_properties['content'].map{|property| property['title']}
  end
end