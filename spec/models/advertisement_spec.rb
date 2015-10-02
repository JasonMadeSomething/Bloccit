require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:ad) {Advertisement.create!(title: "A New Ad Title", copy: "A New Ad Copy Body", price: 1000)}
  
  describe "attributes" do
    it "should respond to title" do
      expect(ad).to respond_to(:title)
    end
    
    it "should respond to copy" do
      expect(ad).to respond_to(:copy)
    end
    
    it "should respond to price" do
      expect(ad).to respond_to(:price)
    end
  end
end
