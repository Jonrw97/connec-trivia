class UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @users = []
    end
  end
end
