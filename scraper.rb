require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(doc)
    @doc = doc
  end

  def self.title(doc)
    doc.search('.title a:nth-child(2)').children.inner_text
  end

  def self.url(doc)
    doc.search('.title > a:nth-child(2)')[0].attributes["href"].value
  end

  def self.points(doc)
    doc.search('.score')[0].inner_text.to_i

  end

  def self.item_id(doc)
    doc.search('.age > a')[0].attributes["href"].value.gsub('item?id=', '').to_i
  end

  def self.comments(doc)
    doc.search('span.comment').map do |comments| 
      Scraper.clean_up_whitespace(comments.inner_text) 
    end
  end

  protected
    def self.clean_up_whitespace(x)
      x.gsub("\n","").gsub("-----","").gsub("  ", "")
    end

end