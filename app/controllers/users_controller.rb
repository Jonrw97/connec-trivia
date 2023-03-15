class UsersController < ApplicationController
  def show
    @user = current_user
    @score = current_user.choices.count { |choice| choice.correct }
    @answered = current_user.choices.count
    total_a = 0
    @total_a = @total_a.to_i +  @answered.to_i
    total_correct = 0
    @total_correct = @total_correct.to_i + @score.to_i
    if @score.to_i == 10
      @badge = "🎖"
    else
      @badge = "no badges"
    end
  end
end
