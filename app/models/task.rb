class Task < ApplicationRecord
  belongs_to :user
  has_many :occurances
  validates :name, presence: true
  validates :category, presence: true
end
