class Solo < ActiveRecord::Base
  	belongs_to :user
  	if Rails.env.production? 
  		has_attached_file :picture, styles: { 
    		disp: {geometry: "165x496>", :processors => [:cropper]},
        thumb: {geometry: "248x744>", :processors => [:cropper]},
        print: {geometry: "496x1488>", :processors => [:cropper]}
  			}, default_url: "/images/:style/missing.png"
	else
		has_attached_file :picture, styles: { 
			disp: {geometry: "165x496>", :processors => [:cropper]},
			thumb: {geometry: "248x744>", :processors => [:cropper]},
			print: {geometry: "496x1488>", :processors => [:cropper]}
		}, :url => "/system/:attachment/:id/:style/:filename", :path => ":rails_root/public/system/:attachment/:id/:style/:filename",  default_url: "/images/:style/missing.png"
	end


	# For CRopping
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    
    @geometry ||= {}
    avatar_path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
    # @geometry[style] ||= Paperclip::Geometry.from_file(picture.path(style))
  end
  
  private
  
  def reprocess_avatar
    picture.reprocess!
  end


  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
