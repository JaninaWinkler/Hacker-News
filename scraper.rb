require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(doc)
    @doc = doc
  end

  def self.title(doc)
    doc.search('.title a:nth-child(2)').children.inner_text
    # doc.search('.title > a:nth-child(2)')[0].children[0].inner_text
  end

  def self.url(doc)
    doc.search('.title > a:nth-child(2)')[0].attributes["href"].value
  end

  def self.points(doc)
    # doc.search('.score').map { |points| points.inner_text }
    doc.search('.score')[0].inner_text.to_i

  end

  def self.item_id(doc)
    doc.search('.age > a')[0].attributes["href"].value
  end

  # def self.item_id_comments(doc)
  #   doc.search('.age > a').map { |id| id["href"] }
  # end

  def self.comments(doc)
    doc.search('span.comment').map { |comments| comments.inner_text }
  end

end

# scrape = Scraper.new(Nokogiri::HTML(open("post.html")))
# puts "comments"
# puts scrape.comments
# puts "item id"
# puts scrape.item_id_post
# puts "points"
# puts scrape.points
# puts "url"
# puts scrape.url
# puts "title"
# puts scrape.title