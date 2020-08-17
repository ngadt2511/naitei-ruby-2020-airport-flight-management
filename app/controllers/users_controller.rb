class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_url
  end
end
