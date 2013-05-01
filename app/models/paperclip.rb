class Paperclip < ActiveRecord::Base
	attr_accessible :avatar

	has_attached_file :avatar, styles: {medium: "120x120>", thumb: "80x80>"}, default_url: "/images/coolguy.png"
end