class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all.except_user(current_user)
  end

  def setUserAdmin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def setUserCustomer
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end
end
