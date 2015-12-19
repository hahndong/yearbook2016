class AddVolunteerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :volunteer, :integer, default: 0
  end
end
