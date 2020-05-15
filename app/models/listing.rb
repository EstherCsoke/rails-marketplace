class Listing < ApplicationRecord
   

    belongs_to :user
    has_one_attached :picture
    belongs_to :category
  


end
