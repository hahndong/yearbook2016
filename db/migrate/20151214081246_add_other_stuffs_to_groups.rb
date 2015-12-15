class AddOtherStuffsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :quote, :text
  end
end
