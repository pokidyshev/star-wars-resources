class Person < ApplicationRecord
  has_and_belongs_to_many :films
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  belongs_to :planet
end
