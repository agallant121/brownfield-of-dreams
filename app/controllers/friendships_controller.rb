class FriendshipsController < ApplicationController
  def create
    friend = User.find_by_github_id(params[:github_id])
    if friend 
      Friendship.create(user: current_user, friend: friend)
      current_user.reload
    else
      flash[:error] = "Sorry, that's an invalid ID!"
    end
    redirect_to dashboard_path
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to dashboard_path
  end
end