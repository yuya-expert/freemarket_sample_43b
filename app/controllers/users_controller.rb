class UsersController < ApplicationController
  before_action :set_user, only:[:main_data, :sms_confirmation]

  def main_data
  end

  def sms_confirmation
  end

  def edit
  end

  def payments
  end

  def set_user
    @user = User.new
  end

  private
  def users_params
    params.require(:user).permit(:email, :password)
  end
end
