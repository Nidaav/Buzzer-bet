class AddAccronymToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :acronym, :string
  end
end
