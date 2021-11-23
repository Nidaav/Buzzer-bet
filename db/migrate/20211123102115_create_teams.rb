class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :color
      t.string :logo
      t.string :star_player_img

      t.timestamps
    end
  end
end
