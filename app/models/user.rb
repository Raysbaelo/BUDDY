class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  validates :category_health, presence: true, numericality: {less_than_or_equal_to: 2}
  validates :category_sport, presence: true, numericality: { less_than_or_equal_to: 2}
  validates :category_business, presence: true, numericality: { less_than_or_equal_to: 2 }
  validates :category_hobby, presence: true, numericality: { less_than_or_equal_to: 2}


  after_create :generate_tasks

  private

  def generate_tasks
    GenerateTasks.new.call(self)
  end
end
