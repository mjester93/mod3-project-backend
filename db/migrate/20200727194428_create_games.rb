class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.string :storyline
      t.string :summary
      t.integer :platform_id
      t.datetime :first_release_date

      t.timestamps
    end
  end
end
