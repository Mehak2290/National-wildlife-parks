class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.date :established_date
      t.integer :size
      t.text :description

      t.timestamps
    end
  end
end
