class Task < ApplicationRecord
  belongs_to :user
  has_many :occurances
  validates :name, presence: true
  validates :category, presence: true
  validates :frequence, presence: true

  def done!
    occurances.find(date: Date.today).update!(done: true)
  end
end
