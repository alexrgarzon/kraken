class TasksController < ApplicationController
  before_action :set_task, only: [:accept, :acceptTask, :unaccept, :unacceptTask, :markdone, :markdoneTask, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  before_filter :only => [:new, :create] do
    redirect_to :welcome_index unless current_user #&& current_user.admin?
  end

  #before_filter redirect_to :welcome_index unless current_user, only: [:new, :create]
  #before_filter :redirect, only: [:new, :create]

  before_filter only: [:edit, :update] do
    redirect_to :welcome_index unless current_user && current_user.id == @task.user_id || current_user.admin?
  end

  before_filter only: [:destroy] do
    redirect_to :welcome_index unless (current_user && current_user.admin?) #&& current_user.admin?
  end

  before_filter only: [:accept,:acceptTask] do
    redirect_to :tasks unless current_user && @task.runner_id==0 && current_user.id != @task.user_id
  end

  before_filter only: [:unaccept,:unacceptTask] do
    redirect_to :tasks unless current_user && @task.status==0 && current_user.id == @task.runner_id
  end

  before_filter only: [:markdone,:markdoneTask] do
    redirect_to :tasks unless current_user && (current_user.id == @task.user_id || current_user.id == @task.runner_id) && (@task.status == 1)
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @hash = Gmaps4rails.build_markers(@tasks) do |task, marker|
      marker.lat task.latitude
      marker.lng task.longitude
      marker.json({:id => task.id })
      # marker.picture({
      #  "url" => "/logo.png",
      #  "width" =>  32,
      #  "height" => 32})
      marker.infowindow render_to_string(:partial => "taskInfo.html.erb", :locals => { :object => task})
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def accept
    # @task.runner_id = current_user.id
    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: 'Task was successfully accepted.' }
    #   format.json { head :no_content }
    # end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.runner_id = 0
    @task.status = 0

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.runner_id = current_user.id
    @task.status = 1
    #@man.man = 15
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def acceptTask
    @task.runner_id = current_user.id
    @task.status = 1
    @task.save
    #format.html { redirect_to @task, notice: 'Task was successfully accepted.' }
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task was successfully accepted.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  def unaccept
  end

  def unacceptTask
    @task.runner_id = 0
    @task.status = 0
    @task.save
    #format.html { redirect_to @task, notice: 'Task was successfully accepted.' }
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task was successfully unaccepted.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  def markdone

  end

  def markdoneTask
    @task.status = 2
    @task.save
    #format.html { redirect_to @task, notice: 'Task was successfully accepted.' }
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task was successfully unaccepted.' }
      format.json { render :show, status: :ok, location: @task }
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
        @task = Task.find(params[:id])
      rescue
        redirect_to :error404
      ensure
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :title, :user_id, :payment_description, :category, :runner_id, :address, :location, :category_id)
    end
end
