class CreatePikachus < ActiveRecord::Migration
  def change
    create_table :pikachus do |t|
      t.integer :remaining_power
      t.string :cause_of_death

      t.timestamps
    end
  end
end
