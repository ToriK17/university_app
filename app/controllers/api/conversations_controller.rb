class Api::ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
     # this is where all conversations are shown. 
    @conversations = current_user.conversations.order('updated_at DESC')
    render 'index.json.jb'
  end

  # def index
  #   @conversation = Conversation.between(current_user).order('updated_at DESC')
  #   render 'index.json.jb'
  # end

  def show
    # this is where one to one messages are shown. 
    @conversation = Conversation.find(params[:id])
    @conversation.messages.sort
    render 'show.json.jb'
  end

  # def show
  #   @conversation = Conversation.find_by(current_user[:sender_id])
  #   render 'show.json.jb'
  # end

  # def create
  #   @conversation = Conversation.new(
  #   sender_id: current_user.id,
  #   # recipient_id: post.user_id
  #   recipient_id: params[:recipient_id]
  #   )
  #   if @conversation.save
  #     render 'show.json.jb'
  #   else
  #     render json: {errors: @conversation.errors.full_messages}, status: :bad_request  
  #   end   
  # end

  def create
    # finding the matched user from a post: 
    
    matched_user = params[:user_id]
    
    # add to existing convo or make new one 
    if Conversation.between(current_user.id, matched_user)
     .present? 
      @conversation = Conversation.between(current_user.id,
       matched_user).first       
    else
      @conversation = Conversation.new(
        sender_id: current_user.id,
        recipient_id: matched_user)
    end

    if @conversation.save
        render 'show.json.jb'
      else
        render json: {errors: @conversation.errors.full_messages}, status: :unprocessable_entity
    end
    # redirect_to conversation_messages_path(@conversation)
  end


end
