class StaticPagesController < ApplicationController

  def home
  	if signed_in?
  		@user = current_user
  		@micropost = @user.microposts.build 
    	@feed_items = @user.feed.paginate(page: params[:page], per_page: 15)
  	else
  	@user = User.new
  	end
	end
end