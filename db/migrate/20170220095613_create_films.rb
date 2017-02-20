class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :director
      t.integer :episode_id
      t.text :opening_crawl
      t.string :producer
      t.date :release_date
      t.string :title

      t.timestamps
    end
  end
end
