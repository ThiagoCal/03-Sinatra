class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Copy-paste your code from previous exercise
  validates :title, presence: true, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :user, presence: true
end
