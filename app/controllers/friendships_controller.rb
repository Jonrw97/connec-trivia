class FriendshipsController < ApplicationController
  # find user using the params from url reciever
  # asker is current user
  # make a new frienship instances
  # render updated friend row
  def create
    receiver = User.find(params[:user_id])

    @friendship = Friendship.new
    @friendship.receiver = receiver
    @friendship.asker = current_user

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_path, { message: 'Friend added successfully' }, status: :created }
        format.json
      else
        format.html { render "user/index", status: :unprocessable_entity }
        format.json
      end
    end
  end
end
