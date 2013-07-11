namespace :searches do
  desc "Delete Searches from database"
  task reset: :environment do
    Search.destroy_all
  end
end