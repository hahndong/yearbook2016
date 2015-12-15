class AddPictureToSolos < ActiveRecord::Migration
  def change
     add_attachment :solos, :picture
  end
end
