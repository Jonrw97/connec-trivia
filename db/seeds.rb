require "json"
require "open-uri"
require "date"
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

##############
# making users
p "Creating Rick & Morty"

url = "https://rickandmortyapi.com/api/character/1/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)

rick = User.new(
  username: rm_users['name'],
  email: "rick@test.com",
  password: 'test123',
  lifeline_count: 3
)
rick.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
rick.save

url = "https://rickandmortyapi.com/api/character/2/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
morty = User.new(
  username: rm_users['name'],
  email: "morty@test.com",
  password: 'test123',
  lifeline_count: 3
)
morty.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
morty.save

p "Rick & Morty Created"

friendship = Friendship.new
friendship.asker = rick
friendship.receiver = morty
friendship.status = 1
friendship.save

p "Creating Background Characters"

url = "https://rickandmortyapi.com/api/character/3/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user3 = User.new(
  username: rm_users['name'],
  email: "test3@test.com",
  password: 'test123',
  lifeline_count: 3
)
user3.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user3.save
p "#{rm_users['name']} created with id #{user3.id}"

url = "https://rickandmortyapi.com/api/character/4/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user4 = User.new(
  username: rm_users['name'],
  email: "test4@test.com",
  password: 'test123',
  lifeline_count: 3
)
user4.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user4.save
p "#{rm_users['name']} created with id #{user4.id}"

url = "https://rickandmortyapi.com/api/character/5/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user5 = User.new(
  username: rm_users['name'],
  email: "test5@test.com",
  password: 'test123',
  lifeline_count: 3
)
user5.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user5.save
p "#{rm_users['name']} created with id #{user5.id}"

url = "https://rickandmortyapi.com/api/character/150/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user6 = User.new(
  username: rm_users['name'],
  email: "test6@test.com",
  password: 'test123',
  lifeline_count: 3
)
user6.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user6.save
p "#{rm_users['name']} created with id #{user6.id}"

url = "https://rickandmortyapi.com/api/character/242/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user7 = User.new(
  username: rm_users['name'],
  email: "test7@test.com",
  password: 'test123',
  lifeline_count: 3
)
user7.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user7.save
p "#{rm_users['name']} created with id #{user7.id}"

url = "https://rickandmortyapi.com/api/character/331/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user8 = User.new(
  username: rm_users['name'],
  email: "test8@test.com",
  password: 'test123',
  lifeline_count: 3
)
user8.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user8.save
p "#{rm_users['name']} created with id #{user8.id}"

url = "https://rickandmortyapi.com/api/character/118/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user9 = User.new(
  username: rm_users['name'],
  email: "evil@test.com",
  password: 'test123',
  lifeline_count: 3,
  admin: true
)
user9.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user9.save
p "#{rm_users['name']} created with id #{user9.id}"

url = "https://rickandmortyapi.com/api/character/47/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user10 = User.new(
  username: rm_users['name'],
  email: "test9@test.com",
  password: 'test123',
  lifeline_count: 3
)
user10.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user10.save
p "#{rm_users['name']} created with id #{user10.id}"

url = "https://rickandmortyapi.com/api/character/196/"
rm_serialized = URI.open(url).read
rm_users = JSON.parse(rm_serialized)
user11 = User.new(
  username: rm_users['name'],
  email: "test10@test.com",
  password: 'test123',
  lifeline_count: 3
)
user11.photo.attach(io: URI.open(rm_users['image']), filename: "#{rm_users['name']}.jpeg", content_type: "image/png")
user11.save
p "#{rm_users['name']} created with id #{user10.id}"

p "Background Characters Created"
users = [user3, user4, user5, user7]

users.each do |user|
  friendship = Friendship.new
  friendship.receiver = morty
  friendship.asker = user
  friendship.save
end

users = [user3, user4, user5, user6, user7, user8, user11]
# friendships
p "creating friendships"
users.each do |user|
  # rick
  friendship = Friendship.new
  friendship.asker = rick
  friendship.receiver = user
  friendship.status = 1
  friendship.save
end

#################
# smart users
p "making smart users"
smart_users = []
count = 1
6.times do
  user = User.new(
    username: "smart#{count}",
    email: "smart#{count}@test.com",
    password: 'test123',
    lifeline_count: 3
  )
  user.save
  smart_users.push(user)
  count += 1
end

#################
# making questions

p "Accessing Trivia api for todays questions"
url = "https://the-trivia-api.com/api/questions/"
trivia_serialized = URI.open(url).read
trivia = JSON.parse(trivia_serialized)
p "creating questions"

trivia.each do |t|
  question = Question.create( prompt: t['question'], difficulty: t['difficulty'], question_date: Date.today)
  choice = Choice.new
  choice.question_id = question.id
  choice.content = t['correctAnswer']
  choice.correct = true

  choice2 = Choice.new
  choice2.question_id = question.id
  choice2.content = t['incorrectAnswers'].pop
  choice2.correct = false

  choice3 = Choice.new
  choice3.question_id = question.id
  choice3.content = t['incorrectAnswers'].pop
  choice3.correct = false

  choice4 = Choice.new
  choice4.question_id = question.id
  choice4.content = t['incorrectAnswers'].pop
  choice4.correct = false

  choices = [choice, choice2, choice3, choice4].shuffle
  choices.each(&:save)
  p t['question']
  p t['correctAnswer']

  users.each do |user|
    UserChoice.create(
      user_id: user.id,
      choice_id: choices.sample.id
    )
  end
  smart_choice = choices.select(&:correct)
  smart_users.each do |user|
    UserChoice.create(
      user_id: user.id,
      choice_id: smart_choice[0].id
    )
  end
end

demo = trivia.reverse
demo.pop
demo.pop
demo.pop
demo.each do |q|
  question = Question.find_by(prompt: q['question'])
  smart_choice = question.choices.select(&:correct)
  UserChoice.create(
    user_id: rick.id,
    choice_id: smart_choice[0].id
  )
end

#####################
# user history
users.push(rick)
p "Accessing Trivia api for users history"
url = "https://the-trivia-api.com/api/questions/"
trivia_serialized = URI.open(url).read
trivia = JSON.parse(trivia_serialized)
p "creating questions"

20.times do
  trivia.each do |t|
    question = Question.create( prompt: t['question'], difficulty: t['difficulty'], question_date: Date.yesterday)
    choice = Choice.new
    choice.question_id = question.id
    choice.content = t['correctAnswer']
    choice.correct = true

    choice2 = Choice.new
    choice2.question_id = question.id
    choice2.content = t['incorrectAnswers'].pop
    choice2.correct = false

    choice3 = Choice.new
    choice3.question_id = question.id
    choice3.content = t['incorrectAnswers'].pop
    choice3.correct = false

    choice4 = Choice.new
    choice4.question_id = question.id
    choice4.content = t['incorrectAnswers'].pop
    choice4.correct = false

    choices = [choice, choice2, choice3, choice4].shuffle
    choices.each(&:save)

    users.each do |user|
      UserChoice.create(
        user_id: user.id,
        choice_id: choices.sample.id
      )
    end
  end
end

p "created #{Question.count} questions"
######################

p "seed has finished"
