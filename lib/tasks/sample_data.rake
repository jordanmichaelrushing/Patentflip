namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Jordan",
						email: "jordan@rushingfitness.com",
						password: "Texman02",
						password_confirmation: "Texman02",
						biz_law: "lawyer")
    admin.toggle!(:admin)
    
		20.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(name: name,
		email: email,
		password: password,
		password_confirmation: password)
		end


		users = User.all
		25.times do
			content = Faker::Lorem.sentence(15)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end
