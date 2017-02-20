class JoinTables < ActiveRecord::Migration[5.0]
  def change
    create_join_table :films, :starships
    create_join_table :films, :people
    create_join_table :films, :vehicles
    create_join_table :films, :species
    create_join_table :films, :planets

    create_join_table :people, :species
    create_join_table :people, :starships
    create_join_table :people, :vehicles
  end
end
