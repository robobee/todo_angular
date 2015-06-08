require 'rails_helper'

describe Api::TasksController do

  describe 'GET #index' do

    before(:each) do
      @tasks = [
        FactoryGirl.create(:task),
        FactoryGirl.create(:task),
        FactoryGirl.create(:task)
      ]
    end

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
      expect(response.body).to eq(@tasks.to_json)
    end

  end

end
