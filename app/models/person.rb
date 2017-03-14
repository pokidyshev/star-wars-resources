class Person < ApplicationRecord
  default_scope { order :id }

  has_and_belongs_to_many :films
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  belongs_to :planet

  PER_PAGE = [10, 20, 50].freeze
  PER_PAGE_DEFAULT = PER_PAGE[0]

  def self.page(number, per_page)
    pp = (per_page || PER_PAGE_DEFAULT).to_i
    offset = (number.to_i - 1) * pp
    Person.offset(offset).limit(pp)
  end

  def self.pages_number(per_page)
    pp = (per_page || PER_PAGE_DEFAULT).to_i
    cnt = Person.count
    offset = (cnt % pp).zero? ? 0 : 1
    cnt / pp + offset
  end

end
