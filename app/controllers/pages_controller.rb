class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @users = User.all
    @score = current_user.choices.count { |choice| choice.correct }
  end
end
