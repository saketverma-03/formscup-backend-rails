class FormsController < ApplicationController
  before_action :set_form, only: %i[ show update destroy ]

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
    @form = Form.new(form_params)

    if @form.save
      render json: @form, status: :created, location: @form
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /forms/1
  def update
    if @form.update(form_params)
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
      params.expect(form: [ :name, :project_id, :fields, :auto_reply_to_field, :token, :dev_token ])
    end
end
