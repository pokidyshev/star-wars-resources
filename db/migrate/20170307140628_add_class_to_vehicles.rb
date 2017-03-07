class AddClassToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_reference :vehicles, :veh_class, foreign_key: true
  end
end
