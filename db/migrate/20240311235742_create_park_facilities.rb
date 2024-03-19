class CreateParkFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :park_facilities do |t|
      t.references :park, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
    
    add_index :park_facilities, [:park_id, :facility_id], unique: true
  end
end
