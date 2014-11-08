class EmailService

  def self.notify episode_id
    # here will be email sending
    users = Episode.find(episode_id).users.pluck(:email)
    puts "Email Notification was sent to #{users.to_s}"
  end

end