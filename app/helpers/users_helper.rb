module UsersHelper
  
  def posts?(user)
    !(user.posts.empty?) ? true : false
  end
  
  def comments?(user)
    !(user.comments.empty?) ? true : false
  end
end
