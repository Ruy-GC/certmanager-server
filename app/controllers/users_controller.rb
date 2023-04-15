
class UsersController < ApplicationController
  def index
    users = User.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded Users', data:users}, status: :ok
  end
end


