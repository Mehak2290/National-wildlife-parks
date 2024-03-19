class CreateWildlives < ActiveRecord::Migration[7.1]
  def change
    create_table :wildlives do |t|
      t.string :species_name
      t.string :habitat
      t.string :population_status
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
