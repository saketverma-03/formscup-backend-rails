class UserController < ApplicationController
  def update_password
    # TODO logic was rushed, please improve
    # password and password conformation internal validation do not work
    current_email = Current.user.email
    if user = User.authenticate_by(email: current_email, password: params[:current_password])
      if Current.user.update(password: params[:new_password], password_confirmation: params[:new_password])
        render json: { message: "Password updated" }
        return
      end
    else
      render json: { error: "That email or password is incorrect" }, status: :forbidden
      return
    end
    render json: { message: "success" }
  end

  def update_pswd_params
    params.expect(:current_password, :new_password, :confirm_new_password)
  end
end
