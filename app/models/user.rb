class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:validatable
  has_and_belongs_to_many :episodes
  validates :email, uniqueness: true
end
