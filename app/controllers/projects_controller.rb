class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
    @lists = @project.lists.order(:position)
    @prediction = PredictionService.predict_next_action(@project)
    Rails.logger.info("Prediction: #{@prediction.inspect}")
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
