class MilestonesController < ApplicationController

  def new
    $law = 'm'
    @filing = Filing.find(params[:filing_id])
    @milestone = @filing.milestones.new
    @user = current_user
    @users = User.find_by_id(@filing.user_id)
    @search = Search.new
  end

  def create
    @search = Search.new
    @filing = Filing.find(params[:id])
    @user = current_user
    @users = User.find_by_id(@filing.user_id)
    @milestone = @filing.milestones.create(params[:milestone])
    @milestone.mile_id = @filing.filing_title
    if @milestone.save
      flash[:success] = "Milestones Added!"
      redirect_to @milestone
    else
      render 'new'
    end
  end

  def show
    @filing = Filing.find(params[:filing_id])
    @milestone = @filing.milestones.find(params[:id])
    @user = current_user
    @users = User.find_by_id(@filing.user_id)
    @search = Search.new
  end

  def edit
    $law = 'me'
    @filing = Filing.find(params[:filing_id])
    @milestone = @filing.milestones.all
    @user = current_user
    @users = User.find_by_id(@filing.user_id)
    @search = Search.new
  end

  def update
    @search = Search.new
    @filing = Filing.find(params[:id])
    @user = current_user
    @users = User.find_by_id(@filing.user_id)
    @milestone = Milestone.find(params[:mile_id])
    if @milestone.update_attributes(params[:milestone])
      flash[:success] = "Milestones Edited!"
      redirect_to @milestone
    else
      render 'new'
    end
  end
end