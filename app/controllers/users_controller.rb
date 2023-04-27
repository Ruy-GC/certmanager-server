
class UsersController < ApplicationController
  def index
    users = User.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded Users', data:users}, status: :ok
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      token = encode_token({email: @user.email})
      render json: {
        user: @user,
        token: token
      },status: ok

    else
      render json: {
        error: 'invalid username or password'
        }, status: :unprocessable_entity
    
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end


