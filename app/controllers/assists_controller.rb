class AssistsController < ApplicationController
  def index
    @assists_receiver = current_user.assists_as_receiver.select { |r| r.message.nil? }
    @assists_asker = current_user.assists_as_asker.select do |a|
      current_user.choices.where(question_id: a.question.id).first.nil?
    end

    # for navbar notify
    navbar_notify
  end

  def new
    @friends = current_user.all_friends
    @question = Question.find(params[:question_id])
    @assist = Assist.new
  end

  def create
    current_user.update(lifeline_count: current_user.lifeline_count - 1)
    @assist = Assist.new(assist_params)
    @assist.question = Question.find(params[:question_id])
    @assist.asker = current_user
    if @assist.save
      redirect_to question_path(current_user.next_question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @assist = Assist.find(params[:id])
    @question = @assist.question
    @choices = @question.choices
  end

  def update
    @assist = Assist.find(params[:id])
    @assist.update(safe_params)
    redirect_to assists_path
  end

  private

  def safe_params
    params.require(:assist).permit(:message)
  end

  def assist_params
    params.require(:assist).permit(:receiver_id)
  end
end
