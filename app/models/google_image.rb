class GoogleImage
  # not used !

  require 'open-uri'

  def initialize(result)
    @data = result
  end

  # search function returns array of GoogleImage objects
  def self.search(expression)
    results = fetch(expression)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    objects
  end


  # attributes

  def thumbnail
    @data['tbUrl']
  end


  private

  def self.fetch(expression)
    url = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{expression}&rsz=5"
    json_response = open(url).read
    response = JSON.parse(json_response)
    response['responseData']['results']
  end

end
