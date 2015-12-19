class Solo < ActiveRecord::Base
  	belongs_to :user
  	if Rails.env.production? 
  		has_attached_file :picture, styles: { print: "1080x1080>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
	else
		has_attached_file :picture, styles: { print: "1080x1080>", thumb: "300x300>" }, :url => "/system/:attachment/:id/:style/:filename", :path => ":rails_root/public/system/:attachment/:id/:style/:filename",  default_url: "/images/:style/missing.png"
	end

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
