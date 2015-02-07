class AddColumnCauseOfDeathToPikachu < ActiveRecord::Migration
  def change
		add_column :pikachus, :cause_of_death_2, :string
  end
end
