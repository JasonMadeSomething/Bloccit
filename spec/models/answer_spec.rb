require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "A New Question", body: "A New Question Body", resolved: false)}
  let(:answer) {Answer.create!(question: question, body: "A New Answer Body")}
  
  describe "attributes" do
    
    it "should respond to body" do
      expect(answer).to respond_to(:body)  
    end
    
  end
  
end
