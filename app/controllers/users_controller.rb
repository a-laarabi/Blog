class UsersController < ApplicationController
  # before_action :set_user, only: %i[show update destroy]
  # before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
