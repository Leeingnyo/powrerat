class AddColumnSurvivalToPikachu < ActiveRecord::Migration
  def change
    add_column :pikachus, :survival, :integer
  end
end
