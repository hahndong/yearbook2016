class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :mobile_number, :string
  end
end
