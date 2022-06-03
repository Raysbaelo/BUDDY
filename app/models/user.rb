class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  def current_tasks # les tâches à faire
    Task.joins(:occurances).where(occurances: {date: Date.today, done: nil}, tasks: {user_id: id} )
  end
end
