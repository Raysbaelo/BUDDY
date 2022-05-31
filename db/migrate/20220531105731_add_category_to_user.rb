class AddCategoryToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :category_health, :string
    add_column :users, :category_sport, :string
    add_column :users, :category_business, :string
    add_column :users, :category_hobby, :string
  end
end
