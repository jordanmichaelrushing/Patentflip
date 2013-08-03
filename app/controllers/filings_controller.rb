class FilingsController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :lawyer_page
  before_filter :message_user
  before_filter :my_job_only, only: [:show]
  before_filter :correct_user, only: [:edit, :destroy]

  def index
    @search = Search.new
    @filings = Filing.paginate(page: params[:page], per_page: 10)
    @users = User.paginate(page: params[:user_id], per_page: 10)
  end

  def new
    @filing = Filing.new
    @search = Search.new
  end

  def create
    @search = Search.new
    @filing = Filing.create(params[:filing])
    @filing.user_id = current_user.id
    @filing.user_name = @user.name
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
    @users = User.find(@filing.user_id)
    @lawyer = User.find_by_name(@filing.lawyer_name)

    if request.path != filing_path(@filing)
      redirect_to @filing, status: :moved_permanently
    end

    if ((@filing.lawyer_accept == true) && (@filing.user_accept == true) &&((@filing.user_id == @user.id) || (@filing.lawyer_name == @user.name)))
      redirect_to about_path
    end
  end

  def edit
    $law = "e"
    @search = Search.new
    @filing = Filing.find(params[:id])
  end
 
  def update
    @filing = Filing.find(params[:id])
    if $law == "l"
      @filing.lawyer_name = @user.name
      @filing.lawyer_accept = true
    elsif $law == "u"
      @filing.lawyer_name = @user.name
      @filing.user_accept = true      
    end
    
    if @filing.update_attributes(params[:filing])
      flash[:success] = "Job listing updated"
      redirect_to @filing
    else
      render 'edit'
    end
  end

  def hire_me
    $law = "l"
    @filing = Filing.find(params[:id])
    @search = Search.new
  end

  def destroy
    @filing.destroy
    redirect_back_or root_path
  end

  private

  def correct_user
    @filing = Filing.find(params[:id])
    @users = User.find_by_id(@filing.user_id)
    redirect_to (new_filing_path), error: "Cannot edit others jobs!" unless current_user?(@users)
  end

  def lawyer_page
    redirect_to (root_path), error: "This section is not for those in a business aspect" if current_user.biz_law == "business"
  end

  def my_job_only
    @filing = Filing.find(params[:id])
    @users = User.find_by_id(@filing.user_id)
    redirect_to (root_path), error: "This job cannot be viewed by you, sorry!" unless ((current_user?(@users)) || (current_user.biz_law == "lawyer"))
  end
end