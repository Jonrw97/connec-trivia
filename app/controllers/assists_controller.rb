class AssistsController < ApplicationController
  def new
    @friends = current_user.all_friends
    @question = Question.find(params[:question_id])
    @assist = Assist.new
  end

  def create
    @assist = Assist.new(safe_params)
    @assist.question = Question.find(params[:question_id])
    @assist.asker = current_user
    if @assist.save
      redirect_to question_path(current_user.next_question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def safe_params
    params.require(:assist).permit(:receiver_id)
  end
end
