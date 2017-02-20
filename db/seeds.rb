require 'rest-client'
require 'json'

# Constants and helpers

BASE_URL = 'http://swapi.co/api/'.freeze

def id_from_url(url)
  url.split('/').last
end

# Get films

url = BASE_URL + 'films/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  films = hash['results']

  films.each do |item|
    Film.create(id: id_from_url(item['url']),
                director: item['director'],
                episode_id: item['episode_id'],
                opening_crawl: item['opening_crawl'],
                producer: item['producer'],
                release_date: item['release_date'],
                title: item['title'])
  end

  url = hash['next']
  break if url.nil?
end

# Get planets

url = BASE_URL + 'planets/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  planets = hash['results']

  planets.each do |item|
    planet = Planet.create(id: id_from_url(item['url']),
                           climate: item['climate'],
                           diameter: item['diameter'],
                           gravity: item['gravity'],
                           name: item['name'],
                           orbital_period: item['orbital_period'],
                           population: item['population'],
                           rotation_period: item['rotation_period'],
                           surface_water: item['surface_water'],
                           terrain: item['terrain'])

    item['films'].each do |film_url|
      Film.find(id_from_url(film_url)).planets << planet
    end
  end

  url = hash['next']
  break if url.nil?
end

# Get people

url = BASE_URL + 'people/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  people = hash['results']

  people.each do |item|
    planet = Planet.find(id_from_url(item['homeworld']))
    person = Person.create(id: id_from_url(item['url']),
                           birth_year: item['birth_year'],
                           eye_color: item['eye_color'],
                           gender: item['gender'],
                           hair_color: item['hair_color'],
                           height: item['height'],
                           mass: item['mass'],
                           name: item['name'],
                           skin_color: item['skin_color'],
                           planet_id: planet.id)

    item['films'].each do |film_url|
      Film.find(id_from_url(film_url)).people << person
    end

    planet.people << person
  end

  url = hash['next']
  break if url.nil?
end

# Get starships

url = BASE_URL + 'starships/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  starships = hash['results']

  starships.each do |item|
    ship = Starship.create(id: id_from_url(item['url']),
                           starship_class: item['starship_class'],
                           passengers: item['passengers'],
                           name: item['name'],
                           model: item['model'],
                           max_atmosphering_speed: item['max_atmosphering_speed'],
                           manufacturer: item['manufacturer'],
                           length: item['length'],
                           hyperdrive_rating: item['hyperdrive_rating'],
                           crew: item['crew'],
                           cost_in_credits: item['cost_in_credits'],
                           consumables: item['consumables'],
                           cargo_capacity: item['cargo_capacity'],
                           MGLT: item['MGLT'])

    item['films'].each do |film_url|
      Film.find(id_from_url(film_url)).starships << ship
    end

    item['pilots'].each do |pilot_url|
      Person.find(id_from_url(pilot_url)).starships << ship
    end
  end

  url = hash['next']
  break if url.nil?
end

# Get vehicles

url = BASE_URL + 'vehicles/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  vehicles = hash['results']

  vehicles.each do |item|
    vehicle = Vehicle.create(id: id_from_url(item['url']),
                             vehicle_class: item['vehicle_class'],
                             passengers: item['passengers'],
                             name: item['name'],
                             model: item['model'],
                             max_atmosphering_speed: item['max_atmosphering_speed'],
                             manufacturer: item['manufacturer'],
                             length: item['length'],
                             crew: item['crew'],
                             cost_in_credits: item['cost_in_credits'],
                             consumables: item['consumables'],
                             cargo_capacity: item['cargo_capacity'])

    item['films'].each do |film_url|
      Film.find(id_from_url(film_url)).vehicles << vehicle
    end

    item['pilots'].each do |pilot_url|
      Person.find(id_from_url(pilot_url)).vehicles << vehicle
    end
  end

  url = hash['next']
  break if url.nil?
end

# Get species

url = BASE_URL + 'species/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  species = hash['results']

  species.each do |item|
    home = item['homeworld']
    planet = home ? Planet.find(id_from_url(home)) : nil
    spec = Species.create(id: id_from_url(item['url']),
                          average_height: item['average_height'],
                          average_lifespan: item['average_lifespan'],
                          classifiation: item['classifiation'],
                          designation: item['designation'],
                          eye_colors: item['eye_colors'],
                          hair_colors: item['hair_colors'],
                          language: item['language'],
                          name: item['name'],
                          skin_colors: item['skin_colors'],
                          planet_id: planet&.id)

    item['films'].each do |film_url|
      Film.find(id_from_url(film_url)).species << spec
    end

    item['people'].each do |person_url|
      Person.find(id_from_url(person_url)).species << spec
    end

    planet.species << spec if planet
  end

  url = hash['next']
  break if url.nil?
end
