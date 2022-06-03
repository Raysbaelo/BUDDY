class Task < ApplicationRecord
  belongs_to :user
  has_many :occurances
  validates :name, presence: true
  validates :category, presence: true
  validates :frequence, presence: true

  def done!
    occurances.find(date: Date.today).update!(done: true)
  end

  def color
    case category
    when 'sport' then '#ffc107'
    when 'aaa' then '#ff00FF'
    when 'bbb' then '#00FFFF'
    when 'ccc' then '#FFFF00'
    end
  end
end
