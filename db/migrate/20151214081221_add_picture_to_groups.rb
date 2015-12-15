class AddPictureToGroups < ActiveRecord::Migration
  def change
    add_attachment :groups, :picture
  end
end
