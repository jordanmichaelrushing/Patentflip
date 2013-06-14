class AuctionsController < ApplicationController
	
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @auctions = Auction.paginate(page: params[:page])
    @users = User.paginate(page: params[:user_id])
  end

	def new
		@auction = Auction.new
	end

	def create
		@auction = Auction.create(params[:auction])
		@auction.user_id = current_user.id
    current_user.pat_selling += 1
    if @auction.save
			flash[:success] = "Uploaded your patent on the marketplace!"
			redirect_to @auction
		else
			render 'new'
		end
	end

	def show
		@auction = Auction.find(params[:id])
    @user = User.find_by_id(@auction.user_id)
    @vid_url = :vid_url
    if request.path != auction_path(@auction)
      redirect_to @auction, status: :moved_permanently
    end
	end

  def edit
    @user = User.find_by_id(@auction.user_id)
    @auction = Auction.find(params[:id])
  end
 
  def update
    @auction = Auction.find(params[:id])
    if @auction.update_attributes(params[:auction])
      flash[:success] = "Patent listing updated"
      redirect_to @auction
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
    @auction = Auction.find(params[:id])
    @user = User.find_by_id(@auction.user_id)
    redirect_to (new_auction_path), error: "Cannot edit others information!" unless current_user?(@user)
  end
end
