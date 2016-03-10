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

