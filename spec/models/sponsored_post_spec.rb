require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sPost) {topic.sponsoredPosts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1000 ) }
  
  it { should belong_to(:topic) }
  
  describe "attributes" do
    
    it "should respond to title" do
      expect(sPost).to respond_to(:title)
    end
    
    it "should respond to body" do
      expect(sPost).to respond_to(:body)
    end
    
    it "should respond to price" do
      expect(sPost).to respond_to(:price)
    end
  end
end
