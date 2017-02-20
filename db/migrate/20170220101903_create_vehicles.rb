class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :cargo_capacity
      t.string :consumables
      t.string :cost_in_credits
      t.string :crew
      t.string :length
      t.string :manufacturer
      t.string :max_atmosphering_speed
      t.string :madel
      t.string :name
      t.string :passegners
      t.string :vehicle_class

      t.timestamps
    end
  end
end
