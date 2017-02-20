class CreatePlanets < ActiveRecord::Migration[5.0]
  def change
    create_table :planets do |t|
      t.string :climate
      t.string :diameter
      t.string :gravity
      t.string :name
      t.string :orbital_period
      t.string :population
      t.string :rotation_period
      t.string :surface_water
      t.string :terrain

      t.timestamps
    end
  end
end
