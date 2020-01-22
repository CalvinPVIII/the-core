class Weapon < ApplicationRecord
  has_many :players
  has_many :levels
end
