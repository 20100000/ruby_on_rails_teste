class PersonController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @users = User.all
  end
end
