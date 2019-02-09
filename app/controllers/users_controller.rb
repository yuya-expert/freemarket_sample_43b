class UsersController < ApplicationController
  before_action :set_user, only:[:main_data, :sms_confirmation]

  def main_data
  end

  def sms_confirmation
  end

  def create
    user = User.new(users_params)
    if user.save
      redirect_to controller: :products, action: :index
    else
      render :main_data
    end
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
