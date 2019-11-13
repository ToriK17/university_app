class Api::MessagesController < ApplicationController
  


  def show
    @message =Message.find_by(id: params[:id])
    render 'show.json.jb'
  end
  
  
  def create
    @message = Message.new(
      user_id: current_user.id,
      body: params[:body], 
      conversation_id: params[:conversation_id], 
    )
    @message.save

    ActionCable.server.broadcast "messages_channel", {
      id: @message.id,
      user_name: @message.user.user_name,
      body: @message.body,
      conversation_id: @message.conversation_id,
      created_at: @message.created_at.strftime("%b %e, %l:%M %p"),
      image: @message.user.image
    }
    
    render "show.json.jb"
  end
end
