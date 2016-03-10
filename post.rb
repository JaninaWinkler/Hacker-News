class Post 

  attr_reader :title, :url, :points, :item_id, :all_comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @all_comments = []
  end

  def comments
    @all_comments
  end

  def add_comment(comment)
    @all_comments << comment
  end

end

# post = Post.new("Title", "URL", 40, "item-id?77777")
# puts post 
# post.add_comment("COOOL!!!!!")
# post.add_comment("YES")
# post.add_comment("Awesome")
# post.add_comment("Boo you suck")
# post.comments

