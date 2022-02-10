class User < ActiveRecord::Base
  has_many :posts


  # TODO: Add some validation
  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A.+@.+\z/ }
  validates :username, uniqueness: true
  # TODO: Add some callbacks
end
