class StaticPagesController < ApplicationController

  def home
  	if signed_in?
  		@user = current_user
      @search = Search.new
      @messengers = @user.received_messages
  		@micropost = @user.microposts.build 
    	@feed_items = @user.feed.paginate(page: params[:page], per_page: 15)
      respond_to do |format|
      format.js
      format.html # index.html.erb
      format.xml  { render :xml => @feed_items }
    end
  	else
  	@user = User.new
  	end
	end

  def help
    @search = Search.new
    @user = current_user
  end

  def faq
    @search = Search.new
    @user = current_user
  end

  def about
    @search = Search.new
    @user = current_user
  end
end