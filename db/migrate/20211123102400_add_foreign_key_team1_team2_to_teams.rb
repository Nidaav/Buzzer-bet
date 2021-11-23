class AddForeignKeyTeam1Team2ToTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :team1
    remove_column :games, :team2
    add_reference(:games, :team1, foreign_key: { to_table: :teams })
    add_reference(:games, :team2, foreign_key: { to_table: :teams })
  end
end
