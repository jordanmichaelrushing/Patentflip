class MessengersController < ApplicationController
  autocomplete :user, :name, :full => true
  
  before_filter :set_user
  before_filter :correct_user, only: [:show, :index]
  def index
    if params[:mailbox] == "sent"
      @messengers = @user.sent_messages
    else
      @messengers = @user.received_messages
    end
  end
  
  def show
    @messenger = Messenger.read_message(params[:id], current_user)
  end
  
  def new
    @messenger = Messenger.new
    if params[:reply_to]
      @reply_to = @user.received_messages.find(params[:reply_to])
      unless @reply_to.nil?
        @messenger.to = @reply_to.sender.id
        @messenger.subject = "Re: #{@reply_to.subject}"
        @messenger.body = "\n\n*Original message*\n\n #{@reply_to.body}"
      end
    end
  end
  
  def create
    @messenger = Messenger.new(params[:messenger])
    @messenger.sender = current_user
    @messenger.recipient = User.find(params[:user_id])

    if @messenger.save
      flash[:notice] = "Message sent"
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
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def correct_user
    @user = User.find(params[:user_id])
    redirect_to user_messengers_path(current_user), error: "Cannot view others mailboxes!" unless current_user?(@user)
  end
end