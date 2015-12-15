class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_attached_file :picture, styles: { print: "1080x1080>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
