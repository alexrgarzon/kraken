class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @tasks = Task.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id]).id
    @categoryName = Category.find(params[:id]).name
    @searchParam = params[:search]
    Rails.logger.debug("My category: #{@category}")
    Rails.logger.debug("My searchParam: #{@searchParam}")

    #@openTasks = Task.order(sort_column + " " + sort_direction)
    @openTasks = Task.searchCatOpen(@searchParam,@category)

    #@inProgressTasks = Task.order(sort_column + " " + sort_direction)
    #@inProgressTasks = @inProgressTasks.getCatInProgress(@category)
    @inProgressTasks = Task.getCatInProgress(@category)


    #@completedTasks = Task.order(sort_column + " " + sort_direction)
    #@completedTasks = @completedTasks.getCatCompleted(@category)
    @completedTasks = Task.getCatCompleted(@category)

    @hash = Gmaps4rails.build_markers(@openTasks) do |task, marker|
      marker.lat task.latitude
      marker.lng task.longitude
      marker.json({:id => task.id })
      # marker.picture({
      #  "url" => "/logo.png",
      #  "width" =>  32,
      #  "height" => 32})
      marker.infowindow render_to_string(:partial => "taskCatInfo.html.erb", :locals => { :object => task})
    end

  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
