class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :d_id

      t.timestamps
    end
  end
end
