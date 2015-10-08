require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:my_user) {User.create!(name: "Blochead", email: "blochead@bloc.io", password: "password" )}
  
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST sessions" do
    
    it "returns http success" do
      post :create, session: {email: my_user.email }
      expect(response).to have_http_status(:success)
    end
    
    it "initializes a session" do
      post :create, session: {email: my_user.email, password: my_user.password }
      expect(assigns(:session)) == my_user.id
    end
    
  end
    
end
