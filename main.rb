require_relative 'post'
require_relative 'comment'
require_relative 'scraper'
require 'nokogiri'
require 'open-uri'
require 'colorize'

class WrongNumberOfArguments < StandardError
end

  def create_post(doc)
    begin
      if doc.nil?
        raise WrongNumberOfArguments, "Must have valid values in URL."
      else
          title = Scraper.title(doc)
          url = Scraper.url(doc)
          points = Scraper.points(doc)
          item_id = Scraper.item_id(doc)
          comments = Scraper.comments(doc)
          post =Post.new(title, url, points, item_id)
    # comments.each do |comment| 
    #   new_comment = Comment.new(comment)
    #   post.add_comment(new_comment)
    # end
      end
        rescue WrongNumberOfArguments => e
          puts e.message
    end  
  end

def display_info(post)
  begin
    if post.nil?
        raise WrongNumberOfArguments, "URL was not entered"
    else
        formatted_post = Nokogiri::HTML(open(post))
        begin
          if !formatted_post
              raise WrongNumberOfArguments, "Must enter a valid URL."
          else
              display_post = create_post(formatted_post)
              puts "Post Title: #{display_post.title}".colorize(:color => :magenta)
              puts "Number of comments: #{display_post.comments.length}".colorize(:color => :light_blue)
              puts "User's points: #{display_post.points}".colorize(:color => :cyan)
          end
          rescue WrongNumberOfArguments => e # rescue belongs to the nested argument.
            puts e.message
          rescue Exception => t
            puts "The URL entered is not valid or missing"
        end
    end
    rescue WrongNumberOfArguments => e # rescue belongs to the main argument.
    puts e.message
  end
end
 

# display_info(ARGV[0]) unless ARGV[0].nil? 
display_info(ARGV[0])
