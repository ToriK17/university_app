class Api::PostsController < ApplicationController

  before_action :authenticate_user, only: [:create, :update, :destroy] 
  
  def create
    @post = Post.new(
      details: params[:details], 
      professor_name: params[:professor_name], 
      course_id: params[:course_id], 
      user_id: current_user[:id]
      )
    
    if @post.save
      
      # once it saves then I add the post resources 
      render json: {message: 'Post created'}, status: :created
    else 
      render json: {errors: post.errors.full_messages}, status: :bad_request
    end  
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jb'
  end

  def update    
    @post = Post.find(params[:id])

    if @post.user_id == current_user[:id]  
      @post.update(
        details: params[:details] || @post.details, 
        professor_name: params[:professor_name] || @post.professor_name, 
        course_id: params[:course_id] || @post.course_id
        )
      @post.save 
    else 
      render json: {}, status: :unauthorized  
    end 
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

end
