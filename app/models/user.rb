class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy


  # validates :category_health, numericality: {less_than_or_equal_to: 2}
  # validates :category_sport, numericality: { less_than_or_equal_to: 2}
  # validates :category_business, numericality: { less_than_or_equal_to: 2 }
  # validates :category_hobby, numericality: { less_than_or_equal_to: 2}
end
