class CreateBuddies < ActiveRecord::Migration[6.1]
  def change
    create_table :buddies do |t|
      t.integer :state
      t.string :health
      t.string :sport
      t.string :hobby
      t.string :business
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
