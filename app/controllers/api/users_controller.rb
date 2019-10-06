class Api::UsersController < ApplicationController

  def create
    user = User.new(
      user_name: params[:user_name], 
      email: params[:email], 
      password: params[:password]
      )

    if user.save
      render json: {message: 'User created'}, status: :created
    else 
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end     
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])

    @user.user_name = params[:user_name] || @user.user_name
    @user.email = params[:email] || @user.email
    @user.password_digest = params[:password_digest] || @user.password_digest

    @user.save
    render 'show.json.jb'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "User account removed"}
  end
end
