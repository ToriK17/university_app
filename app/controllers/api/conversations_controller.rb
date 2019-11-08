class Api::ConversationsController < ApplicationController

  def create
    @current_post = Post.find(params[:id])
    @conversation = Conversation.new(
      sender: current_user[:id],
      recipient: @current_post.id
      )
  end
  
end
