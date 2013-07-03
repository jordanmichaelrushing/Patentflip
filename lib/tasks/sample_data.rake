namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
<<<<<<< HEAD
		admin = User.create!(name: "Jordan Rushing Test",
						email: "Puait02@gmail.com",
						password: "Texman02",
						password_confirmation: "Texman02")
=======
		admin = User.create!(name: "Ubscured",
						email: "Ubscured",
						password: "Ubscured",
						password_confirmation: "Ubscured")
>>>>>>> 5dfd98770cdc1068ec21ccd5e94eedf6c5af489e
    admin.toggle!(:admin)
99.times do |n|
name = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password)
end


		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end
