require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { Rating.create!(severity: :PG) }
  
  it { should belong_to :rateable }
  it { should have_many :topics }
  it { should have_many :posts }
  
  describe "attributes" do
    
    it "should respond to severity" do
      expect(rating).to respond_to(:severity)
    end
    
    it "should respond to PG?" do
      expect(rating).to respond_to(:PG?)
    end
    
    it "should respond to PG13?" do
      expect(rating).to respond_to(:PG13?)
    end
    
    it "should respond to R?" do
      expect(rating).to respond_to(:R?)
    end
  end
  
  describe ".update_rating" do
    it "should "
    
  end
end
