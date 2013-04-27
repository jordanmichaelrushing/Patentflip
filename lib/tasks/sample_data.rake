namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Jordan Rushing",
						email: "Puait02@gmail.com",
						password: "Texman02",
						password_confirmation: "Texman02")
		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end
