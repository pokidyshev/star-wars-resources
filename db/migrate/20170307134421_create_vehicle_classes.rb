class CreateVehicleClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :veh_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
