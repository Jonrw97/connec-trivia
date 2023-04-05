require 'open-uri'
require 'json'
require 'date'
class NewGameJob < ApplicationJob
  queue_as :default

  def perform
    p "Performing NewGameJob..."
    update_players_lifeline
    urls = [
      'https://the-trivia-api.com/api/questions?limit=3&difficulty=easy',
      'https://the-trivia-api.com/api/questions?limit=4&difficulty=medium',
      'https://the-trivia-api.com/api/questions?limit=3&difficulty=hard'
    ]
    trivia = fetch_trivia(urls)
    create_questions(trivia.shuffle)
    p "NewGameJob Complete"
  end

  private

  def fetch_trivia(urls)
    trivia = []
    urls.each do |url|
      data_serialized = URI.parse(url).open.read
      data = JSON.parse(data_serialized)
      data.each { |d| trivia.push(d) }
    end
    trivia
  end

  def update_players_lifeline
    users = User.all
    users.each do |user|
      user.lifeline_count = 3
      user.save
    end
  end

  def create_questions(trivia)
    trivia.each do |t|
      question = Question.create(prompt: t['question'], difficulty: t['difficulty'], question_date: Date.today)
      choice = Choice.new(question_id: question.id, content: t['correctAnswer'], correct: true)
      choice2 = Choice.new(question_id: question.id, content: t['incorrectAnswers'].pop, correct: false)
      choice3 = Choice.new(question_id: question.id, content: t['incorrectAnswers'].pop, correct: false)
      choice4 = Choice.new(question_id: question.id, content: t['incorrectAnswers'].pop, correct: false)
      choices = [choice, choice2, choice3, choice4].shuffle
      choices.each(&:save)
    end
  end
end
