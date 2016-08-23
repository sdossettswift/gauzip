class PostsController < ApplicationController
  # before_action :authenticate_user!

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please sign in."
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.message = params[:post][:message]
    @post.user = @current_user

    if @post.save
     redirect_to root_path, notice: "Gauzip Whispered!"
    else
     render :new
   end
  end

  def edit
     @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    @post.message = params[:post][:message]
    if @post.save
     redirect_to root_path, notice: "Gauzip Updated!"
    else
     render :edit
    end
  end


  def delete
      @post = Post.find_by id: params[:id]
      @post.destroy
      redirect_to root_path, notice: "Gauzip deleted. History altered!"
  end

  def index
    @posts = Post.all
  end

  def timeline
    follower_ids = following_users.pluck(:id)
    all_ids = follower_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

  def detail
    @post = Post.find_by id: params[:id]
  end
end
