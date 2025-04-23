class ListsController < ApplicationController
  before_action :set_project
  before_action :set_list, only: [:edit, :update, :destroy]

  def new
    @list = @project.lists.build
    # Ensure @project is set by the before_action
  end

  def create
    @list = @project.lists.build(list_params)
    if @list.save
      redirect_to @project, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # ... other actions ...

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_list
    @list = @project.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end