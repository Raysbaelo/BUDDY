class CreateOccurances < ActiveRecord::Migration[6.1]
  def change
    create_table :occurances do |t|
      t.date :date
      t.boolean :done
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
