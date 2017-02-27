class UsersController < ApplicationController
  def new
  end

  def profile
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
