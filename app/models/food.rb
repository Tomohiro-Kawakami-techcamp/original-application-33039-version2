class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :price,    numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    end
end
