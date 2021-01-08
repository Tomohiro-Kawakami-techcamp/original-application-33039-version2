class Comment < ApplicationRecord
  belongs_to :user

  validates :nickname,     presence: true
  validates :message,      presence: true
end
