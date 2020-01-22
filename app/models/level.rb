class Level < ApplicationRecord
  has_many :mobs
  belongs_to :weapon 
end
