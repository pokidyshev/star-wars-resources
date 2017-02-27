class Film < ApplicationRecord
  has_and_belongs_to_many :people
  has_and_belongs_to_many :planets
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles

  has_attached_file :poster,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: 'http://placehold.it/300x300'

  validates_attachment_content_type :poster, content_type: %r{\Aimage\/.*\z}

  def name
    title
  end
end
