class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]
  # before_action :is_my_project, only: %i[ show update destroy ]

  # GET /projects
  def index
    @projects = Current.user.projects
    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create
    ActiveRecord::Base.transaction do
    @project = Project.new(project_params)

    if @project.save
      current_user = Current.user.projects
      current_user << @project
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      unless Current.user.projects.exists?(params.expect(:id))
        render json:  { error: "you are not authorized to access this project" }, status: :unauthorized
        return
      end
      @project = Project.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.expect(project: [ :name, :description ])
    end
end
