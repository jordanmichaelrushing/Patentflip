class AuctionsController < ApplicationController
	
  before_filter :correct_user, only: [:new, :create, :edit, :update]

	def index
	end

	def new
		@auction = Auction.new
	end

	def create
		params[:user]
		@auction = Auction.new(params[:auction] )
		if @auction.save
			flash[:success] = "Uploaded new video!"
			redirect_to @auction
		else
			render 'new'
		end
	end

	def show
		@auction = Auction.find(params[:id])
    @vid_url = :vid_url
	end

    private
 
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to (new_user_auction_path(current_user)), error: "Cannot edit others information!" unless current_user?(@user)
  end
end
