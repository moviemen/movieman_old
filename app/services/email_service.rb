class EmailService

  def self.notify episode_id
    users = Episode.find(episode_id).users.pluck(:email)
    users.each{ |u| NotificationMailer.new_episode_added(episode_id, u.email).deliver }
  end

end