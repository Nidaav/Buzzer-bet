class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :winner
      t.string :top_scorer
      t.integer :total_points
      t.string :top_rebounder
      t.string :top_passer
      t.string :man_of_the_match
      t.integer :gap_points
      t.integer :end_result

      t.timestamps
    end
  end
end
