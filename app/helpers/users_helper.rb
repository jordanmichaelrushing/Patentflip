module UsersHelper

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
