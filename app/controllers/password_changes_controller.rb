class PasswordChangesController < ApplicationController
  before_action :get_user, only: [:edit, :update]

  def edit
    return unless current_user
  end

  def update
    if params[:user][:password_old].blank?
      flash.now[:danger] = t ".pw_not_empty"
      render :edit
    elsif !@user.authenticate params[:user][:password_old]
      flash.now[:danger] = t ".not_correct_password"
      render :edit
    elsif @user.update user_params
      log_in @user
      flash.now[:success] = t ".change_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end
end
