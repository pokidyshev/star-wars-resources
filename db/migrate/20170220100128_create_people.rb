class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :birth_year
      t.string :eye_color
      t.string :gender
      t.string :hair_color
      t.string :height
      t.string :mass
      t.string :name
      t.string :skin_color
      t.belongs_to :planet

      t.timestamps
    end
  end
end
