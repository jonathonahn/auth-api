class UsersController < ApplicationController
  def create
    if current_user
      user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
      if user.save
        render json: { message: "User created successfully" }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    else  
      render json: {message: "please log in to create users"}
    end
  end
end
