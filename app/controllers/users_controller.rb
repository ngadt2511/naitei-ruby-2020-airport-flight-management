class UsersController < ApplicationController
  before_action :check_admin, only: %i(edit update)

  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_url
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update user_params
      flash[:success] = t ".updated"
      redirect_to pilots_path
    else
      flash[:success] = t ".update_fail"
      render :edit
    end
  end

  private

  def check_admin
    redirect_to root_url unless  current_user.admin?
  end

  def user_params
    params.require(:user).permit User::USERS_PARAMS
  end
end
