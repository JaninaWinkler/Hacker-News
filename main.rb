require_relative 'post'
require_relative 'comment'
require_relative 'scraper'
require 'nokogiri'

# class Application 

  @doc = Nokogiri::HTML(open('post.html'))

  def create_post(doc)
    title = Scraper.title(doc)
    url = Scraper.url(doc)
    points = Scraper.points(doc)
    item_id = Scraper.item_id(doc)
    comments = Scraper.comments(doc)
    post =Post.new(title, url, points, item_id)
    comments.each do |comment| 
      new_comment = Comment.new(comment)
      post.add_comment(new_comment)
    end
    return post
  end

create_post(@doc)
