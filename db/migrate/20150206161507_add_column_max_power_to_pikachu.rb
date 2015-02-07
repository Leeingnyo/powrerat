class AddColumnMaxPowerToPikachu < ActiveRecord::Migration
  def change
    add_column :pikachus, :max_power, :integer
  end
end
