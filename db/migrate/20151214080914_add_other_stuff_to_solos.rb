class AddOtherStuffToSolos < ActiveRecord::Migration
  def change
    add_column :solos, :quote, :text
    add_column :solos, :ans1, :text
    add_column :solos, :ans2, :text
    add_column :solos, :ans3, :text
    add_column :solos, :ans4, :text
    add_column :solos, :ans5, :text
    add_column :solos, :ans6, :text
    add_column :solos, :ans7, :text
    add_column :solos, :ans8, :text
    add_column :solos, :qn9, :string
    add_column :solos, :ans9, :text
    add_column :solos, :qn10, :string
    add_column :solos, :ans10, :text
  end
end
