class Api::V1::TasksController < Api::V1::BaseController
  def index
    respond_with Tasks.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(task_params)
    # @task.done = false
    
    # if @task.save
    #   redirect_to root_url
    # else 
    #   @errors = @task.errors.full_messages
    #   render 'new'
    # end
    
    respond_with :api, :v1, Task.create(task_params)
  end

  def update
    @task = task.find_by(params[:id])
    
    if @task
      @task.update_attributes(done: params[:done])
      respond_with @task, json: @task
    else
    end
    
  end

  def destroy
    # @task = task.find_by(params[:id])
    
    # if @task
    #   @task.destroy
    # else
    # end
    respond_with Task.destroy(params[:id])
  end
  
  private
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
