class Listing < ApplicationRecord
    belongs_to :user
    validates :title, :description, :price, :picture, :category_id, presence: true
    has_one_attached :picture
    belongs_to :category


end
