class Task < ApplicationRecord
  belongs_to :user
  has_many :occurances, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true

  scope :done, -> { joins(:occurances).where(occurances: {done: true, date: Date.today}) }

  def done!
    occurances.find_by(date: Date.today).update!(done: true)
  end

  def color
    case category
    when 'sport' then '#F5C44D'
    when 'health' then '#A0E295'
    when 'hobby' then '#FF8954'
    when 'business' then '#FF5F5F'
    end
  end

  def logo
    case category
    when 'sport' then "sport.png"
    when 'health' then "health.png"
    when 'hobby' then "hobby.png"
    when 'business' then "business.png"
    end
  end

end
