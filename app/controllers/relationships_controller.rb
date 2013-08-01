class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js

  def create
    @user = current_user
    @users = User.find(params[:relationship][:followed_id])
    current_user.follow!(@users)
    respond_with @users
  end
  
  def destroy
    @user = current_user
    @users = Relationship.find(params[:id]).followed
    current_user.unfollow!(@users)
    respond_with @users
  end
end