class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable\
  
  has_many :posts
  
  acts_as_followable
  acts_as_follower
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow
    @user = User.find(params[:id])
  
    if current_user
      if current_user == @user
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
        RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
        flash[:notice] = "You are now following #{@user.monniker}."
      end
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.monniker}.".html_safe
    end
  end
  
  def unfollow
    @user = User.find(params[:id])
  
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.monniker}."
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.monniker}.".html_safe
    end
  end
  
end
