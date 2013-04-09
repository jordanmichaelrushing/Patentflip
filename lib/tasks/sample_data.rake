namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Jordan Rushing",
						email: "Puait02@gmail.com",
						password: "Texman02",
						password_confirmation: "Texman02")

	end
end
