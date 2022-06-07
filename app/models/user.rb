class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  def current_tasks
    Task.joins(:occurances).where(occurances: {date: Date.today, done: false}, tasks: {user_id: id} )
  end

  def score
    {
      health: score_by_category(:health),
      sport: score_by_category(:sport),
      business: score_by_category(:business),
      hobby: score_by_category(:hobby)
    }
  end

  # private

  def score_by_category(category)
    (number_task_done(category) + base_score(category)) * 100 / number_task_total(category)
  end

  def number_task_done(category)
    tasks.where(category: category).done.count
  end

  def base_score(category)
    send("category_#{category}")
  end

  def number_task_total(category)
    tasks.where(category: category).count + base_score(category)
  end
end
