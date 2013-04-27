class StaticPagesController < ApplicationController

  def home
#    grav
  	@micropost = current_user.microposts.build 
    @feed_items = current_user.feed.paginate(page: params[:page])
	end

	def message
	end

#  def grav
#    Grav.content
#  end
end