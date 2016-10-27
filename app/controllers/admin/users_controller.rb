class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all.except_user(current_user)
  end
end
