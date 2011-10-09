class Dictionary
  # not used !

  require 'open-uri'

  # choose dictionary type
  def initialize(ditionary_class)
    @dictionary_class = ditionary_class
  end

  # definition of a word
  def definition(word)
    @page = Nokogiri::HTML(open(self.url(word)))
    @dictionary_class.definition(@page)
  end

  # url of the query
  def url(query)
    @dictionary_class::URL_START + @dictionary_class.process_query(query) + @dictionary_class::URL_END
  end

  # factory
  def self.active_dictionaries
    dictionaries = [TheFreeDictionary, MerriamWebster]
    dict_classes = []
    dictionaries.each do |dict|
      dict_classes << self.new(dict)
    end
    dict_classes
  end


  class TheFreeDictionary

    URL_START = 'http://www.tfd.com/'
    URL_END = ''

    def self.definition(page)
      page.css("#MainTxt").to_html
    end

    def self.process_query(query)
      query.gsub(" ", "+")
    end

  end


  class MerriamWebster

    URL_START = 'http://www.merriam-webster.com/dictionary/'
    URL_END = ''

    def self.definition(page)
      page.css("#wordclickDiv").to_html
    end

    def self.process_query(query)
      query.gsub(" ", "%20")
    end

  end


end