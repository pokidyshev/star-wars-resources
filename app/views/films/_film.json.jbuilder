json.extract! film, :id, :director, :episode_id, :opening_crawl, :producer, :release_date, :title, :created_at, :updated_at
json.url film_url(film, format: :json)