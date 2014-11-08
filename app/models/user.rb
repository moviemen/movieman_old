class User < ActiveRecord::Base
  has_and_belongs_to_many :episodes
  validates :email, uniqueness: true
end
