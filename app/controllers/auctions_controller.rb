class AuctionsController < ApplicationController
	
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @auctions = Auction.paginate(page: params[:page])
  end

	def new
		@auction = Auction.new
    @user = User.find(params[:user_id])
	end

	def create
    @user = User.find(params[:user_id])
		params[:auction]
		@auction = Auction.new(params[:auction] )
		if @auction.save
			flash[:success] = "Uploaded your patent on the marketplace!"
			redirect_to [@user, @auction]
		else
			render 'new'
		end
	end

	def show
    @user = User.find(params[:user_id])
		@auction = Auction.find(params[:id])
    @vid_url = :vid_url
	end

  def edit
  end
 
  def update
    user = User.find(params[:user_id])
    @auction = Auction.find(params[:id])
    if @auction.update_attributes(params[:auction])
      flash[:success] = "Profile updated"
      redirect_to [@user, @auction]
    else
      render 'edit'
    end
  end

  def destroy
    @auctions.destroy
    redirect_back_or root_path
  end

  def patents
    @users = User.paginate(page: params[:page])
    @auctions = Auction.paginate(page: params[:page])
  end

    private
 
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to (new_auction_path), error: "Cannot edit others information!" unless current_user?(@user)
  end
end
