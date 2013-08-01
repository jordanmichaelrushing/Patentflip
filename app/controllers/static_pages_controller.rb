class StaticPagesController < ApplicationController

  def home
  	if signed_in?
  		@user = current_user
      @users = current_user
      @search = Search.new
      @auctions = Auction.paginate(page: params[:page], per_page: 10, order: "created_at desc")
      @filings = Filing.paginate(page: params[:page], per_page: 10)
      @messengers = @user.received_messages
  		@micropost = @user.microposts.build
      @microposts = Micropost.paginate(page: params[:page], per_page: 10, order: "created_at desc") 
    	@feed_items = @user.feed.paginate(page: params[:page], per_page: 10)
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