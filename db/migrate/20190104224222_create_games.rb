class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :person_id
      t.string :title
      t.string :console
      t.string :condition
      t.string :release_date
      t.string :details

      t.timestamps
    end
  end
end
