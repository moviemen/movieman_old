class NotificationMailer < ActionMailer::Base
  include Sidekiq::Mailer
  
  default from: 'notifications@' << Rails.application.secrets.domain_name

  def new_episode_added episode_id, user_email
    @episode = Episode.find episode_id
    mail(to: user_email, subject: 'MovieMan notification')
  end

end
