require 'rails_helper'
include RandomData
RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sPost) {my_topic.sponsoredPosts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1000 ) }
  
  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: sPost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: sPost.id
      expect(response).to render_template :show
    end
    
    it "assigns sPost to @sPost" do
      get :show, topic_id: my_topic.id, id: sPost.id
      expect(assigns(:sPost)).to eq(sPost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
    
    it "instantiates @sPost" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sPost)).not_to be_nil
    end
  end
  
  describe "POST create" do
    
    it "increases the number of sponsored post by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph }}.to change(SponsoredPost,:count).by(1)
    end
    
    it "assigns the new sponsored post to @sPost" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph }
      expect(assigns(:sPost)).to eq SponsoredPost.last
    end
    
    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph }
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: sPost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: sPost.id
      expect(response).to render_template :edit
    end
    
    it "assigns post to be updated to @sPost" do
      get :edit, topic_id: my_topic.id, id: sPost.id
      sPost_instance = assigns(:sPost)
      expect(sPost_instance.id).to eq sPost.id
      expect(sPost_instance.title).to eq sPost.title
      expect(sPost_instance.body).to eq sPost.body
    end
  end

describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      
      put :update, topic_id: my_topic.id, id: sPost.id, sponsored_post: {title: new_title, body: new_body}
      
      updated_s_post = assigns(:sPost)
      expect(updated_s_post.id).to eq sPost.id
      expect(updated_s_post.title).to eq new_title
      expect(updated_s_post.body).to eq new_body
    end
    
    it "redirects to the updated sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      put :update, topic_id: my_topic.id, id: sPost.id, sponsored_post: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_topic, sPost]
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the sponsored post" do
      delete :destroy, topic_id: my_topic.id, id: sPost.id
      count = Post.where({id: sPost.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to topic show" do
       delete :destroy, topic_id: my_topic.id, id: sPost.id
       expect(response).to redirect_to my_topic
    end
  end
end
