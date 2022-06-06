class GenerateTasks
  DATA = {
    'category_sport' => :daily,
    'category_health' => :daily,
    'category_hobby' => :daily,
    'category_business' => :daily
  }

  AVAILABLE_TASKS = YAML.load_file('data/tasks.yml')

  def call(user)
    @user = user
    DATA.each do |category, frequence|
      score = user.send(category)
      number = 3 - score
      create_tasks(category.gsub('category_', ''), number)
    end
  end

  def create_tasks(category, number)
    @default_tasks = AVAILABLE_TASKS[category].first(number)
    @default_tasks.each do |task_data|
      task = Task.create!(
        name: task_data,
        category: category,
        user: @user
      )
      generate_occurances(task)
    end
  end

  private

  def generate_occurances(task)
    60.times do |i|
      data = i.days.from_now
      Occurance.create!(task: task, date: data, done: false)
    end
  end
end
