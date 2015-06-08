module Api
  class TasksController < ApplicationController

    def index
      @tasks = Task.all
      render json: @tasks, status: 200, root: false
    end

    def destroy
      task = Task.find(params[:id])
      task.destroy
      head 204
    end

    def create
      task = Task.new(task_params)
      if task.save
        render json: task, status: 201, root: false, 
          location: api_task_url(task)
      else
        render json: task.errors, status: 422
      end
    end

    def update
      task = Task.find(params[:id])
      if task.update(task_params)
        render json: task, status: 200, root: false
      else
        render json: task.errors, status: 422
      end
    end

    private

      def task_params
        params.require(:task).permit(:description)
      end

  end
end
