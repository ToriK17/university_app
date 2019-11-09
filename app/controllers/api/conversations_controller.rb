class Api::ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new(
    sender_id: current_user.id,
    # recipient_id: post.user_id
    recipient_id: params[:recipient_id]
    )
    if @conversation.save
      render 'show.json.jb'
    else
      render json: {errors: @conversation.errors.full_messages}, status: :bad_request  
    end   
  end

  def show
    # this is where messages are shown. 
    @conversation = Conversation.find(params[:id])

    render 'show.json.jb'
  end

  def index
    # this is where all conversations are shown. 
    @conversation = Conversation.find_by(current_user[:id])
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
  end

end
