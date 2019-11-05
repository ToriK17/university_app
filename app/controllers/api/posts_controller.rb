class Api::PostsController < ApplicationController

  before_action :authenticate_user, only: [:create, :update, :destroy] 
   
  def create
    @post = Post.new(
      details: params[:details], 
      professor_name: params[:professor_name], 
      course_id: params[:course_id], 
      user_id: current_user[:id]
      )
    
        # resources = [ {id: 1, details: "string"}, {id: 2, details: "string 2" } ] 

    if @post.save  
      resources = params[:post_resources]
     
      resources.each do |resource|
        post_resource = PostResource.create(resource_id: resource[:id],  resource_details: resource[:details], post_id: @post.id)
      end     
      
      render 'show.json.jb', status: :created
    else 
      render json: {errors: @post.errors.full_messages}, status: :bad_request
    end  
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jb'
  end

  def update    
    @post = Post.find(params[:id])
    if @post.user_id == current_user[:id]
     
      @post.details = params[:details] || @post.details 
      @post.professor_name = params[:professor_name] || @post.professor_name 
      @post.course_id = params[:course_id] || @post.course_id
 

      if @post.save
        @post.post_resources.destroy_all

        resources = params[:post_resources]
        resources.each do |resource|
          PostResource.create(resource_id: resource[:id],  resource_details: resource[:details], post_id: @post.id)
        end
        render 'show.json.jb'
      else 
        render json: {errors: @post.errors.full_messages}, status: :bad_request
      end 
    else 
      render json: {}, status: :unauthorized
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user[:id]
      @post.destroy
    else
      render json: {}, status: :unauthorized 
    end       
  end

end
