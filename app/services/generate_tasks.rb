# ates :category_health, presence: true
#   validates :category_sport, presence: true
#   validates :category_business, presence: true
#   validates :category_hobby, presence: true

class GenerateTasks
  DATA = {
    'category_sport' => :weekly,
    'category_health' => :daily,
    'category_hobby' => :daily,
    'category_business' => :monthly
  }

  AVAILABLE_TASKS = YAML.load_file('data/tasks.yml')

  def call(user)
    @user = user
    DATA.each do |category, frequency|
      score = user.send(category)
      number = 3 - score
      create_tasks(category.gsub('category_', ''), frequency, number)
    end
  end

  def create_tasks(category, frequency, number)
    ap "je dois créer #{number} taches pour la catégorie #{category} avec une frequence de #{frequency}"
    ap AVAILABLE_TASKS[category].first(number)
    ap @user
  end
end
