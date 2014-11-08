class NotificationMailer < ActionMailer::Base

  default from: 'notifications@' << Rails.application.secrets.domain_name

  def new_episode_added episode_id, user_email
    @episode = Episode.find episode_id
    mail(to: user_email, subject: 'hello')
  end


end
