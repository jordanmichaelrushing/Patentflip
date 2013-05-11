class AuctionsController < ApplicationController
	
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
	end
end
