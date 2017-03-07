class Vehicle < ApplicationRecord
  has_and_belongs_to_many :films
  has_and_belongs_to_many :people
  belongs_to :veh_class
end

# TODO: remove vehicle_class column
# make class foreign key,
# add dictionary for classes,
# rake task
