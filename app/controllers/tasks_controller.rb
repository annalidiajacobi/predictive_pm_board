class TasksController < ApplicationController
  before_action :set_project
  before_action :set_list

  def new
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.build(task_params.except(:project_id))
    @task.project_id = @project.id
    if @task.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream.append("list_#{@list.id}_tasks", partial: "tasks/task", locals: { task: @task }) }
        format.html { redirect_to project_path(@project), notice: "Task was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def move
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_list
    @list = @project.lists.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :project_id)
  end
end
