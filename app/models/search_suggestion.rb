class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term

  def self.terms_for(prefix)
  	Rails.cache.fetch(["search-terms", prefix]) do
	  	suggestions = where("term like ?", "#{prefix}_%")
	  	suggestions.order("popularity desc").limit(10).pluck(:term)
	end
  end

  def self.index_products
  	Auction.find_each do |a|
  		index_term(a.title)
  		index_term(a.pat_num)
  		a.title.split.each { |t| index_term(t) }
  		a.pat_num.split.each { |t| index_term(t) }
  	end
  	User.find_each do |a|
  		index_term(a.name)
  		index_term(a.email)
  		a.name.split.each { |t| index_term(t) }
  		a.email.split.each { |t| index_term(t) }
  	end
  end

  def self.index_term(term)
  	where(term: term.titleize).first_or_initialize.tap do |suggestion|
  		suggestion.increment! :popularity
  	end
  end
end
