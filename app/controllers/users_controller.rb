class UsersController < ApplicationController
  before_action :authenticate_user!,  only: [:show, :edit]
  
  def show
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to  user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :password, :admin)
  end
end