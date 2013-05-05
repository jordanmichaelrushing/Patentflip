class StaticPagesController < ApplicationController

  def home
  	if signed_in?
  		@user = current_user
  		@micropost = current_user.microposts.build 
    	@feed_items = current_user.feed.paginate(page: params[:page])
  	else
  	@user = User.new
  	end
	end
end