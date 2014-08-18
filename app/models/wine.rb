class Wine < ActiveRecord::Base

  belongs_to :user

  validates :color, :grape_variety, :brand, :rating, presence: true
  
end
