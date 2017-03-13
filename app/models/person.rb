class Person < ApplicationRecord
  default_scope { order :id }

  has_and_belongs_to_many :films
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  belongs_to :planet

  def self.page(number, per_page)
    p = number ? number.to_i : 1
    Person.offset((p - 1) * per_page).limit(per_page)
  end

  def self.pages_number(per_page)
    cnt = Person.count
    offset = (cnt % per_page).zero? ? 0 : 1
    cnt / per_page + offset
  end
end
