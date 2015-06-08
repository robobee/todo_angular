require 'rails_helper'

describe Api::TasksController do

  before(:each) do
    @tasks = [
      create(:task),
      create(:task),
      create(:task)
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

    it "returns 204 status code" do
      delete :destroy, id: @tasks[0]
      expect(response.status).to eq 204
    end
  end

  describe 'POST #create' do
    context "with valid params" do
      it "creates a task in a database" do
        expect {
          post :create, task: attributes_for(:task)
          }.to change(Task, :count).by(1)
      end

      it "returns newly created json object" do
        task = attributes_for(:task)
        post :create, task: task
        expect(json(response.body)[:description]).to eq(task[:description])
      end

      it "returns 201 status code" do
        post :create, task: attributes_for(:task)
        expect(response.status).to eq 201
      end

      it "returns location of a new object" do
        post :create, task: attributes_for(:task)
        task = json(response.body)
        expect(api_task_url(task[:id])).to eq(response.location)
      end
    end

    context "with invalid params" do
      it "does not create task in a database" do
        expect {
          post :create, task: attributes_for(:task,
            description: '')
          }.not_to change(Task, :count)
      end

      it "returns 422 status code" do
        post :create, task: attributes_for(:task,
            description: '')
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PATCH #update' do
    it "changes @task's attributes" do
      task = @tasks[0]
      patch :update, id: task, task: attributes_for(:task,
        description: 'New Description')
      task.reload
      expect(task.description).to eq('New Description')
    end

    it "returns 200 status code" do
      patch :update, id: @tasks[0], task: attributes_for(:task,
        description: 'New Description')
      expect(response.status).to eq 200
    end
  end

end
