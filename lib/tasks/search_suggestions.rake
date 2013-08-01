namespace :search do
  desc "Generate search suggestions from products"
  task index: :environment do
    SearchSuggestion.index_products
  end
end