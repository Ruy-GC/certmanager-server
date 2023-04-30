
class UsersController < ApplicationController

  before_action :set_user, only: [:show, :destroy]
  
  #GET /users
  def index
    users = User.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded Users', data:users}, status: :ok
  end

  #GET /users/:id
  def show
    render json: @user, status: :ok
  end

  def new
    @user = User.new
  end

  #POST /users
  def create
    @user = User.new(user_params)
    #token = encode_token({email: @user.email})
    #p token
    if @user.save
      render @user, status: :created

    else
      render json: @user.errors, status: :unprocessable_entity
    
    end
  end

  #DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  #callbacks
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end


