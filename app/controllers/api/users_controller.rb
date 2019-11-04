class Api::UsersController < ApplicationController

  before_action :authenticate_user, only: [:show, :update, :destroy]

  def create 
    response = Cloudinary::Uploader.upload(params[:image])
    cloudinary_url = response["secure_url"]
    @user = User.new(
      user_name: params[:user_name],
      image: cloudinary_url, 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render 'show.json.jb', status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end


  def show # profile page 
    @user = User.find(params[:id])
    if @user.id == current_user[:id]
      render 'show.json.jb'
    else 
      render json: {}, status: :unauthorized
    end  
  end

  def update
    @user = User.find(params[:id])
    
    if @user == current_user
      @user.update( 
        user_name: params[:user_name] || @user.user_name,
        email: params[:email] || @user.email
      )
      if params[:password]
        @user.password = params[:password]
      end
      @user.save
    else
      render json: {}, status: :unauthorized
    end   
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "User account removed"}
  end
end
