class Search < ActiveRecord::Base
  attr_accessible :catg, :keywords

  def products
    @products ||= find_products
  end

  extend FriendlyId
  friendly_id :keywords, use: [:slugged, :history]

  private

  def find_products
    names = (User.order(:name) && User.order(:email))
    names = names.where("name like ?" && "email like ?", "%#{keywords}%" && "%#{keywords}%") if keywords.present?
    auc_title = (Auction.order(:title) && Auction.order(:pat_off_desc))
    auc_title = auc_title.where("title like ?" && "pat_off_desc like ?", "%#{keywords}%" && "%#{keywords}%") if keywords.present?
    micro = (Micropost.order(:content))
    micro = micro.where("content like ?", "%#{keywords}%") if keywords.present?
    auc_title + micro + names
  end
end
