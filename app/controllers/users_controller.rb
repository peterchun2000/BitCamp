class UsersController < ApplicationController
  def follow
    @profile = Profile.find(params[:id])
    current_user.follow(@profile)
    redirect_to :back
  end

  def unfollow
    @profile = Profile.find(params[:id]) 
    current_user.stop_following(@profile)
    redirect_to :back
  end
end