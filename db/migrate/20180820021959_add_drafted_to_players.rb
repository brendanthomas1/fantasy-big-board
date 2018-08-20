class AddDraftedToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_table :players do |t|
      t.boolean :drafted, default: false
    end
  end
end
