module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, options = { size: 200})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://0.gravatar.com/avatar/#{gravatar_id}.png?s=
												#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

		def patent_sold

		@user = User.new(params[:user])
		@sold = 0
	end

	def patent_buy

		@user = User.new(params[:user])
		@buy = 0
	end

	def patent_sale
		
		@user = User.new(params[:user])
		@sale = 0
	end

	def link_sale
		@link_to_sale = link_to "Number of Patents for sale: #{patent_sale}", root_path, style: 'color: #000000'
	end

	def link_sold
		@link_to_sold = link_to "Number of Patents sold: #{patent_sold}", root_path, style: 'color: #000000'
	end

	def link_buy
		@link_to_buy = link_to "Number of Patents bought: #{patent_buy}", root_path, style: 'color: #000000'
	end
end
