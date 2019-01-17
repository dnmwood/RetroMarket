class AddIgdbIdGenresPlatformsToGamesModel < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :igdb_id, :integer
    add_column :games, :genres, :integer, array: true, default: []
    add_column :games, :platforms, :integer, array: true, default: []
  end
end
