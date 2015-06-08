require 'rails_helper'

describe Api::TasksController do

  before(:each) do
    @tasks = [
      FactoryGirl.create(:task),
      FactoryGirl.create(:task),
      FactoryGirl.create(:task)
    ]
  end

  describe 'GET #index' do
    it "populates an array of all tasks" do
      get :index
      expect(assigns(:tasks)).to match_array(@tasks)
    end
    
    it "returns 200 status code" do
      get :index
      expect(response.status).to eq 200
    end

    it "returns all tasks as json" do
      get :index
      expect(response.body).to eq(@tasks.reverse.to_json)
    end
  end

  describe 'DELETE #destroy' do
    it "destroys a task in a database" do
      expect {
        delete :destroy, id: @tasks[0]
        }.to change(Task, :count).by(-1)
    end

    it "returns an empty json object" do
      delete :destroy, id: @tasks[0]
      expect(response.body).to eq({}.to_json)
    end

    it "returns 200 status code" do
      delete :destroy, id: @tasks[0]
      expect(response.status).to eq 200
    end
  end

  describe 'POST #create' do
    it "creates a task in a database" do
      expect {
        post :create, task: FactoryGirl.attributes_for(:task)
        }.to change(Task, :count).by(1)
    end
    it "returns newly created json object" do
      task = FactoryGirl.attributes_for(:task)
      post :create, task: task
      expect(json(response.body)[:description]).to eq(task[:description])
    end

    it "returns 200 status code" do
      post :create, task: FactoryGirl.attributes_for(:task)
      expect(response.status).to eq 200
    end    
  end

end
