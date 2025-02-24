class FormsController < ApplicationController
  before_action :set_form, only: %i[ show update destroy ]
  before_action :is_my, only: %i[ show update destroy ]

  # GET /forms
  def index
    @forms = Form.all

    render json: @forms
  end

  # GET /forms/1
  def show
    render json: @form
  end

  # POST /forms
  def create
    puts form_params
    @form = Form.new(form_params)

    if @form.save
      render json: @form, status: :created
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /forms/1
  def update
    if @form.update(form)
      render json: @form
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # DELETE /forms/1
  def destroy
    @form.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.expect(form: [ :name,  :project_id, fields: [] ])
    end

    # only allow if form is of the current user
    def is_my
      unless ProjectUser.find_by(user_id: Current.user.id, project_id: params.expect(:project_id))
        render json: { error: "you are not authorised for this action" }, status: :unauthorized
      end
    end
end
