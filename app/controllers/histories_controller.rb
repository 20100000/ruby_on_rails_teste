class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy, :nextStatus]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
    @pending = @histories.select { |history| history.status == 'pending' }
    @started = @histories.select { |history| history.status == 'started' }
    @delivered = @histories.select { |history| history.status == 'delivered' }
    @accepted = @histories.select { |history| history.status == 'accepted' }
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    @projects = Projeto.all
    @users = User.all
  end

  # GET /histories/nextStatus/1
  def nextStatus
    @id = params[:id]
    @history =  History.find(@id)

    puts @history
    if @history.status == 'pending'
      @history.update(:status => 'started')
    elsif @history.status =='started'
      @history.update(:status => 'delivered')
    elsif @history.status =='delivered'
      @history.update(:status => 'accepted')
    end
    redirect_to action: "index"
  end

  # GET /histories/new
  def new
    @history = History.new
    @projects = Projeto.all
    @users = User.all
  end

  # GET /histories/1/edit
  def edit
    @projects = Projeto.all
    @users = User.all
  end

  # POST /histories
  # POST /histories.json
  def create
    @projects = Projeto.all
    @users = User.all
    @history = History.new(history_params)
    @history.status = 'pending'

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:name, :user_id, :projeto_id, :status, :description, :points, :finished_at, :deadline, :id)
    end
end
