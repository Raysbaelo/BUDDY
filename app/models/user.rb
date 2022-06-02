class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  # validates :category_health, presence: true
  # validates :category_sport, presence: true
  # validates :category_business, presence: true
  # validates :category_hobby, presence: true
end
