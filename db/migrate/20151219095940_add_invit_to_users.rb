class AddInvitToUsers < ActiveRecord::Migration
  def change
  	    add_column :users, :invit, :integer
  end
end
