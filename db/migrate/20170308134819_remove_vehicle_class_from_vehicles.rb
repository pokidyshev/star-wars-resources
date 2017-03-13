class RemoveVehicleClassFromVehicles < ActiveRecord::Migration[5.0]
  def change
    remove_column :vehicles, :vehicle_class
  end
end
