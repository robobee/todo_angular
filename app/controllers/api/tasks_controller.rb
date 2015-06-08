module Api
  class TasksController < ApplicationController

    def index
      @tasks = Task.all
      render json: @tasks, status: 200, root: false
    end

  end
end
