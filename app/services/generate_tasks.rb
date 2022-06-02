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
    DATA.each do |category, frequence|
      score = user.send(category)
      number = 3 - score
      create_tasks(category.gsub('category_', ''), frequence, number)
    end
  end

  def create_tasks(category, frequence, number)
    @default_tasks = AVAILABLE_TASKS[category].first(number)
    @default_tasks.each do |task_data|
      Task.create!(
        name: task_data,
        category: category,
        frequence: frequence,
        user: @user
      )
    end
  end
end
