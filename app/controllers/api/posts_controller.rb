class Api::PostsController < ApplicationController

  def create
    @post = Post.new(
      details: params[:details], 
      professor_name: params[:professor_name], 
      course_id: params[:course_id], 
      user_id: params[:user_id]
      )
    @post.save
    redirect_to '/posts/#{@post.id}'
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      details: params[:details], 
      professor_name: params[:professor_name], 
      course_id: params[:course_id], 
      user_id: params[:user_id]
      )
    redirect_to '/posts/#{@post.id}'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

end
