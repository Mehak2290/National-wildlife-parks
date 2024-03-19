class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |t|
      t.references :park, null: false, foreign_key: true
      t.integer :year
      t.integer :total_visitors
      t.integer :camping_visitors

      t.timestamps
    end
  end
end
