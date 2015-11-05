class Rate < ActiveRecord::Base
  enum severity: [:PG, :PG13, :R]
  
  has_many :ratings
  
  belongs_to :rateable, polymorphic: true
  
  has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
  
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post
  
  def self.update_rates(rate_string)
    return Rate.severities[rate_string]
  end
end