class SessionsController < ApplicationController
  skip_before_action :require_logged_in, only: %i(new create)

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate params[:session][:password]
      log_in user
      remember_user user
      redirect_to user
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def remember_user user
    remember user if params[:session][:remember_me] == Settings.sessions.checkbox
  end
end
