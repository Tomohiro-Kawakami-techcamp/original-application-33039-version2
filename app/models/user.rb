class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :orders
         has_many :foods
         has_many :comments
         enum admin: {normal: 0, staff:1}
  
         validates :email,  presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
         validates :name,  presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'Full-width characters' }
         validates :name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' }
end