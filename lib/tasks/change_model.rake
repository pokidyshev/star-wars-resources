namespace :change_model do
  desc "Move vehicle_class column to separate model"
  task vehicle_class_to_model: :environment do
    classes = Vehicle.pluck('DISTINCT vehicle_class')
    classes.each do |c|
      new_class = c.split.map(&:capitalize).join
      vc = VehClass.find_or_create_by(name: new_class)
      Vehicle.where(vehicle_class: c).each do |v|
        vc.vehicles << v
      end
    end
  end
end
