class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
	before_filter :correct_user, only: [:edit, :update]
	before_filter :admin_user, only: :destroy
 
	def index
    @search = Search.new
		@user = current_user
    @users = User.order(:created_at).page(params[:page]).per_page(10)
	    respond_to do |format|
	      format.js
	      format.html # index.html.erb
	      format.xml  { render :xml => @users }
	    end
	end

	def lawyers
    @search = Search.new
    @users = User.paginate(page: params[:page], per_page: 15)
  	@user = current_user
	    respond_to do |format|
	      format.js
	      format.html # index.html.erb
	      format.xml  { render :xml => @users }
	    end
	end

	def show
    @search = Search.new
    @auctions = Auction.paginate(page: params[:page], per_page: 15)
    @filings = Filing.paginate(page: params[:page], per_page: 15)
    @user = current_user
		@users = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page], per_page: 15)
    if request.path != user_path(@users)
      redirect_to @users, status: :moved_permanently
    end
	end
 
  def new
  	@user = User.new
  end
 
  def create
  	params[:user]
    @user = current_user
		@users = User.create(params[:user])
		if @users.save
			sign_in @users
			flash[:success] = "Welcome to Patentflip!"
			redirect_to @users
		else
			render 'new'
		end
	end
 
	def edit
    @user = current_user
    @search = Search.new
	end
 
	def update
    @search = Search.new
		if @user.update_attributes(params[:user])
			sign_in @user
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_path
	end

  def following
    @search = Search.new
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @search = Search.new
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def hire_you
    @search = Search.new
    @user = current_user
    @users = User.find(params[:id])
    @filing = Filing.paginate(page: params[:page], per_page: 5)
  end

	private
 
	def correct_user
		@users = User.find(params[:id])
		redirect_to (root_path), error: "Cannot edit others information!" unless current_user?(@users)
	end
 
	def admin_user
    User.first = user.admin
		redirect_to(root_path) unless current_user.admin?
	end
end