class UsersController < ApplicationController
  def follow
    other_user = User.find(params[:user])
    current_user = User.find(params[:curr_user])
    current_user.follow(other_user)
    redirect_to '/pages/search'
  end

  def unfollow
    other_user = User.find(params[:user])
    current_user = User.find(params[:curr_user])
    current_user.stop_following(other_user)
    redirect_to '/pages/search'
  end

end