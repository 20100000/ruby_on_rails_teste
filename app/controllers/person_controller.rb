class PersonController < ApplicationController
  before_action :authenticate_user!
  # GET /tasks
  # GET /tasks.json
  def index
    @users = User.all
  end
end
