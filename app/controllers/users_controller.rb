class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
	before_filter :correct_user, only: [:edit, :update]
	before_filter :admin_user, only: :destroy
 
	def index
    @search = Search.new
		@user = current_user
		if params[:search]
			@users = User.order(:created_at).page(params[:page]).per_page(10).find(:all, conditions: ['name like ?', "%#{params[:search]}%"])
			if @users.size.zero? 
				flash[:notice] = "No Users Found" 
				@users = User.order(:created_at).page(params[:page]).per_page(10).find(:all) 
			end

		else
	    	@users = User.order(:created_at).page(params[:page]).per_page(10)
		end
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
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page], per_page: 15)
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
	end
 
  def new
  	@user = User.new
  end
 
  def create
  	params[:user]
		@user = User.create(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Patentflip!"
			redirect_to @user
		else
			render 'new'
		end
	end
 
	def edit
    @search = Search.new
	end
 
	def update
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
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

	private
 
	def correct_user
		@user = User.find(params[:id])
		redirect_to (root_path), error: "Cannot edit others information!" unless current_user?(@user)
	end
 
	def admin_user
    User.first = user.admin
		redirect_to(root_path) unless current_user.admin?
	end
end