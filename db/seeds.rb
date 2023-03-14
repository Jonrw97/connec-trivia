require "json"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Cleaning database"
User.destroy_all
UserChoice.destroy_all
Choice.destroy_all
Friendship.destroy_all
Question.destroy_all
Assist.destroy_all

p "Creating users"

User.create(
  username: "Donald",
  email: "test1@test.com",
  password: 'test123',
  lifeline_count: 3
)

user2 = User.create(
  username: "Mickey",
  email: "test2@test.com",
  password: 'test123',
  lifeline_count: 3
)

p "Accessing api"
url = "https://the-trivia-api.com/api/questions/"
trivia_serialized = URI.open(url).read
trivia = JSON.parse(trivia_serialized)
p "creating questions"

trivia.each do |t|
  question = Question.new
  question.prompt = t['question']
  question.difficulty = t['difficulty']
  question.save
  p "created question with id#{question.id}"
  choice1 = Choice.new
  choice1.question_id = question.id
  choice1.content = t['correctAnswer']
  choice1.correct = true
  choice1.save
  choice2 = Choice.new
  choice2.question_id = question.id
  choice2.content = t['incorrectAnswers'].pop
  choice2.correct = false
  choice2.save
  choice3 = Choice.new
  choice3.question_id = question.id
  choice3.content = t['incorrectAnswers'].pop
  choice3.correct = false
  choice3.save
  choice4 = Choice.new
  choice4.question_id = question.id
  choice4.content = t['incorrectAnswers'].pop
  choice4.correct = false
  choice4.save
  choices = [choice1, choice2, choice3, choice4]
  userchoice = UserChoice.create(
    user_id: user2.id,
    choice_id: choices.sample.id
  )
  p userchoice
end

p "created #{Question.count} questions"
