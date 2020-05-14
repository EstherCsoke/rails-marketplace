class Listing < ApplicationRecord
   
    has_many :categories
    belongs_to :user
    has_one_attached :picture


end
