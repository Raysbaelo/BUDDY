class ChangeUserCateogyToBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :category_health, 'boolean USING CAST(category_health AS boolean)'
    change_column :users, :category_sport, 'boolean USING CAST(category_sport AS boolean)'
    change_column :users, :category_business, 'boolean USING CAST(category_business AS boolean)'
    change_column :users, :category_hobby, 'boolean USING CAST(category_hobby AS boolean)'
  end
end
