class NotificationMailer < ActionMailer::Base

  default from: 'notifications@' << Rails.application.secrets.domain_name

  def new_episode_added(episode_id)
    @episode = Episode.find_by_id episode_id
    users = Episode.find(episode_id).users.pluck(:email)
    users.each do |r|
      mail( :to => r,
            :subject => 'hello')
    end
  end


end
