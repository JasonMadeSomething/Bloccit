class FavoriteMailer < ApplicationMailer
  default from: "jason@mailmarketingfla.com"
  
  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@rocky-gorge-8621.heroku.com"
    headers["In-Reply-To"] = "<post/#{post.id}@rocky-gorge-8621.heroku.com>"
    headers["References"] = "<post/#{post.id}@rocky-gorge-8621.heroku.com>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
    
  end
  
  def new_post(user, post)
    headers["In-Reply-To"] = "<post/#{post.id}@rocky-gorge-8621.heroku.com>"
    headers["References"] = "<post/#{post.id}@rocky-gorge-8621.heroku.com>"
    
    @user = user
    @post = post
    
    mail(to: user.email, subject: "#{post.title} created")
  end
end
