class Task < ApplicationRecord
  belongs_to :user
  has_many :occurances, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true

  def done!
    occurances.find(date: Date.today).update!(done: true)
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
    when 'health' then "coeur.png"
    when 'hobby' then "hobby.png"
    when 'business' then "business.png"
    end
  end

end
