class AddConferenceAndApiTeamIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :conference, :string
    add_column :teams, :api_team_id, :string
  end
end
