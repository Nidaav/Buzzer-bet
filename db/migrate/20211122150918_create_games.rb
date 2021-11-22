class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :team1
      t.string :team2
      t.string :winner
      t.string :top_scorer
      t.integer :total_points
      t.string :top_rebounder
      t.string :top_passer
      t.string :man_of_the_match
      t.integer :gap_points

      t.timestamps
    end
  end
end
