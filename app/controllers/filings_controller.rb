class FilingsController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @search = Search.new
    @user = current_user
    @filings = Filing.paginate(page: params[:page], per_page: 10)
    @users = User.paginate(page: params[:user_id], per_page: 10)
  end

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

  def edit
    @search = Search.new
    @user = User.find_by_id(@filing.user_id)
    @filing = Filing.find(params[:id])
  end
 
  def update
    @filing = Filing.find(params[:id])
    if @filing.update_attributes(params[:filing])
      flash[:success] = "Job listing updated"
      redirect_to @filing
    else
      render 'edit'
    end
  end

  def destroy
    @filings.destroy
    redirect_back_or root_path
  end

  def correct_user
    @filing = Filing.find(params[:id])
    @user = User.find_by_id(@auction.user_id)
    redirect_to (new_filing_path), error: "Cannot edit others jobs!" unless current_user?(@user)
  end

end