class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :rank
      t.string :team
      t.string :position_rank
      t.timestamps
    end
  end
end
