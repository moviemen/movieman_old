class Episode < ActiveRecord::Base
  has_and_belongs_to_many :users

  after_save :email_on_updates

  private

  def email_on_updates
    NotificationWorker.perform_async self.id
  end

end
