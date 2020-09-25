class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books
  validates :introduction, presence: false, length: { maximum: 50 }
  validates :name, presence: false, length: { maximum: 20 }
  validates :name, presence: false, length: { minimum: 2 }
end
