class ChangeUserCateogyToIntegers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :category_health, 'integer USING CAST(category_health AS integer)'
    change_column :users, :category_sport, 'integer USING CAST(category_sport AS integer)'
    change_column :users, :category_business, 'integer USING CAST(category_business AS integer)'
    change_column :users, :category_hobby, 'integer USING CAST(category_hobby AS integer)'
  end
end
