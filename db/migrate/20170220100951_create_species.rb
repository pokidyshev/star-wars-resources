class CreateSpecies < ActiveRecord::Migration[5.0]
  def change
    create_table :species do |t|
      t.string :average_height
      t.string :average_lifespan
      t.string :classification
      t.string :designation
      t.string :eye_colors
      t.string :hair_colors
      t.string :language
      t.string :name
      t.string :skin_colors
      t.belongs_to :planet

      t.timestamps
    end
  end
end
