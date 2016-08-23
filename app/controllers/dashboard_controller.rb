class DashboardController < ApplicationController
  def welcome
    @posts = Post.all
  end
end
