class FilingsController < ApplicationController

  def new
    @filing = Filing.new
    @search = Search.new
    @user = current_user
  end

  def create
    @search = Search.new
    @user = current_user
    @filing = Filing.create(params[:filing])
    @filing.user_id = current_user.id
    if @filing.save
      flash[:success] = "Uploaded your job!"
      redirect_to @filing
    else
      render 'new'
    end
  end

  def show
    @search = Search.new
    @filing = Filing.find(params[:id])
    @user = current_user
    @users = User.find(@filing.user_id)

    if request.path != filing_path(@filing)
      redirect_to @auction, status: :moved_permanently
    end
  end

end