class AddForeignKeyLeagueToGame < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :man_of_the_match
    add_reference(:games, :league, foreign_key: { to_table: :leagues })
  end
end
