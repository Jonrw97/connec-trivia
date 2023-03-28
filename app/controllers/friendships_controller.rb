class FriendshipsController < ApplicationController
  # find user using the params from url reciever
  # asker is current user
  # make a new frienship instances
  # render updated friend row
  def create
    receiver = User.find(params[:user_id])
    @friends = []

    @friendship = Friendship.new
    @friendship.receiver = receiver
    @friendship.asker = current_user
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_path, { message: 'Friend added successfully' }, status: :created }
      else
        format.html { render users_path, { message: 'Error' }, status: :unprocessable_entity }
      end
      format.json
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.status = 1
    @friendship.save
    redirect_to users_path
  end
end
