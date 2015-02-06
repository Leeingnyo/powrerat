class AddIndexSiteToDevice < ActiveRecord::Migration
  def change
		add_column :devices, :site_id, :integer
		add_index :devices, :site_id
  end
end
