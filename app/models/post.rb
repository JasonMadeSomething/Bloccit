class Post < ActiveRecord::Base
  has_many :comments
  
  after_create :censor, if: Proc.new { |post| post.id % 5 == 0 }
  
  protected
  
  def censor
    self.title = "CENSORED"
    self.save!
  end
  
end
