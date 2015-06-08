module Api
  class TasksController < ApplicationController

    def index
      @tasks = Task.all
      render json: @tasks, status: 200, root: false
    end

    def destroy
      task = Task.find(params[:id])
      task.delete
      render json: {}, status: 200
    end

    def create
      task = Task.new(task_params)
      if task.save
        render json: task, status: 200, root: false
      end
    end

    private

      def task_params
        params.require(:task).permit(:description)
      end

  end
end
