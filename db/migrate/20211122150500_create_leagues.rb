class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :password
      t.string :conference
      t.integer :number_of_player
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
