require 'date'
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def navbar_notify
    # simple notification system
    @notify_friendships = Friendship.where(status: "pending", receiver_id: current_user.id)[0]
    @notify_receiver = current_user.assists_as_receiver.select { |r| r.message.nil? }[0]
    @notify_asker = current_user.assists_as_asker.reject do |a|
                      a.message.nil? || !current_user.choices.where(question_id: a.question.id).first.nil?
                    end[0]
  end
end
