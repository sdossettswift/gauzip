class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path, notice: "Welcome!"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update
      redirect_to root_path, notice: "Details Updated!"
    else
      render :edit
    end
  end

  def delete
    @user = User.find_by id: params[:id]
    @user.destroy
    redirect_to root_path, notice: "User Destroyed"
  end

  def user_params
    params.require(:user).permit(:username, :password_digest, :email, :full_name)
  end
end
