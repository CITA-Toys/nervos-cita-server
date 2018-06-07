class SessionsController < ApplicationController
  skip_before_action :auth_login, only: [:new, :create]

  # GET /sessions
  def new
  end

  # POST /sessions
  def create
    @user = User.find_by(username: permit_params[:username])

    if @user&.authenticate(permit_params[:password])
      log_in(@user)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  # DELETE /sessions
  def destroy
    log_out
  end

  private

  def permit_params
    params.require(:session).permit(:username, :password)
  end

end
