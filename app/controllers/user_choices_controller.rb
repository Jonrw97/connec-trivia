class UserChoicesController < ApplicationController
  def create
    p params
    @user_choice = UserChoice.new
    @user_choice.user = current_user
    @user_choice.choice = Choice.find(params[:user_choice][:choice_id])

    @choices = @user_choice.choice.question.choices
    respond_to do |format|
      if @user_choice.save
        format.html { redirect_to question_path(current_user.next_question) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "questions/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end
end
