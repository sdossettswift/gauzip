class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
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

  def following
    @users = @current_user.following_users
  end

def follow
  user = User.find_by! id: params[:user_id]
  @current_user.follow(user)
  redirect_to users_path, notice: "✅"
end

def unfollow
  user = User.find_by! id: params[:user_id]
  @current_user.stop_following(user)
  redirect_to users_path, notice: "👻"
end

  def user_params
    params.require(:user).permit(:username, :password_digest, :password, :password_confirmation, :email, :full_name)
  end
end
