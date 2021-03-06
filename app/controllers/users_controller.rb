class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    @user.save
    redirect_to :root
  end

  private

  def post_params
    params.require(:user).permit(:email_address, :username, :password, :user_id)
  end
end
