class AddAdminToUsers < ActiveRecord::Migration
  def change
  	#will need to manually make admin accounts, with true
    add_column :users, :admin, :boolean, :default => false
  end
end
