class RelationshipsController < ApplicationController
  before_filter :signed_in_user
  before_filter :message_user

  respond_to :html, :js

  def create
    @users = User.find(params[:relationship][:followed_id])
    current_user.follow!(@users)
    respond_with @users
  end
  
  def destroy
    @users = Relationship.find(params[:id]).followed
    current_user.unfollow!(@users)
    respond_with @users
  end
end