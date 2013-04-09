namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Jordan Rushing",
						email: "Puait02@gmail.com",
						password: "Texman02",
						password_confirmation: "Texman02",
						content: "https://sphotos-a.xx.fbcdn.net/hphotos-frc1/392977_1996876801934_259865977_n.jpg")

	end
end
