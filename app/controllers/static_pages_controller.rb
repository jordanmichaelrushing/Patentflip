class StaticPagesController < ApplicationController



  def home
  	@micropost = current_user.microposts.build 
    @feed_items = current_user.feed.paginate(page: params[:page])
	end

	def message
	end

  def test
  end

end