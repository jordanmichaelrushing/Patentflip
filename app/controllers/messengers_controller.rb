class MessengersController < ApplicationController
  autocomplete :user, :name, column_name: :name, :full => true, update_elements: {user_messenger_id: :id_element}
  
  before_filter :set_user
  before_filter :correct_user, only: [:show, :index]
  def index
    @search = Search.new
    if params[:mailbox] == "sent"
      @messengers = @user.sent_messages
    else
      @messengers = @user.received_messages
    end
  end
  
  def show
    @search = Search.new
    @messenger = Messenger.read_message(params[:id], current_user)
  end
  
  def new
    @search = Search.new
    @messenger = Messenger.new
    $reply_name = 'n'
    if params[:reply_to]
      $reply_name = 'r'
      @reply_to = @user.received_messages.find(params[:reply_to])
      unless @reply_to.nil?
        $replied = @reply_to.sender.name
        @messenger.to = @reply_to
        @messenger.body = "\n \n *Original message from #{@reply_to.sender.name}* \n \n #{@reply_to.body}"
      end
    end
  end
  
  def create
    @messenger = Messenger.new(params[:messenger])
    @messenger.sender = current_user
    if $reply_name == 'n'
      if @user.name == current_user.name
        @messenger.recipient = User.find_by_name(@messenger.to)
      else
        @messenger.recipient = User.find(params[:user_id])
      end
    else
      @messenger.recipient = User.find_by_name($replied)
    end

    if @messenger.save
      flash[:success] = "Message sent"
      redirect_to user_messengers_path(current_user)
    else
      render :action => :new
    end
  end
  
  def delete_selected
    if request.post?
      if params[:delete]
        params[:delete].each { |id|
          @messenger = Messenger.find(:first, :conditions => ["messengers.id = ? AND (sender_id = ? OR recipient_id = ?)", id, @user, @user])
          @messenger.mark_deleted(@user) unless @messenger.nil?
        }
        flash[:notice] = "Messages deleted"
      end
      redirect_to :back
    end
  end
  
  def receivers
    @user = User.find(params[:user_id])
    @users = @user.receivers.paginate(page: params[:page])
    render :partial => "inbox"
  end

  def senders
    @user = User.find(params[:user_id])
    @users = @user.senders.paginate(page: params[:page])
    render :partial => "sent"
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def correct_user
    @user = User.find(params[:user_id])
    redirect_to user_messengers_path(current_user), error: "Cannot view others mailboxes!" unless current_user?(@user)
  end
end