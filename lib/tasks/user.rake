namespace :user do
  desc "TODO"
  task new_game: :environment do
    NewGameJob.perform_later
  end

end
