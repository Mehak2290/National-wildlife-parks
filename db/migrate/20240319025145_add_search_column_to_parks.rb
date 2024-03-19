class AddSearchColumnToParks < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:parks, :search_content)
    add_column :parks, :search_content, :text
    end
  end
end
