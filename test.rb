User.destroy_all


u = User.create!(email: 'yuyu@gmail.com',
                nickname: 'toto',
                password: 'azerty',
                category_health: 2,
                category_sport: 1,
                category_business: 0,
                category_hobby: 2
                )

GenerateTasks.new.call(u)


ap u.tasks
