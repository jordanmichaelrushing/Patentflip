class GroupsController < ApplicationController

  def hire_me
    $law = "l"
    @filing = Filing.find(params[:id])
    @user = current_user
    @search = Search.new

    if Group.find(params[:id]).present?
      @group = Group.find_by_name(@filing.filing_title)
    else
      @group = Group.new
    end
  end

  def hire_you
    $law = "u"
    @search = Search.new
    @user = current_user
    @users = User.find(params[:id])
    @file = Filing.paginate(page: params[:page], per_page: 5)
    @filing = @file.where(@user.name == (@file.each do |file| file.user_name end))

    if Group.find_by_group_name(@filing.name).present?
      @group = Group.find_by_name(@filing.name)
    else
      @group = Group.new
    end
  end

  def create
    @group = Group.create(params[:group])
    @search = Search.new
    @user = current_user
    @group.users.push(current_user)

    if @group.save
      flash[:success] = "You've been added to the job's potential lawyers!"
      redirect_to @filing
    else
      render 'new'
    end
  end

  def update
    @filing = Filing.find(params[:id])
    @group = Group.find_by_name(@filing.name)
    @search = Search.new
  end
end