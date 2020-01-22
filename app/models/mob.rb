class Mob < ApplicationRecord
  belongs_to :level

  def attack(player_id)
    player = Player.find(player_id)
    health = player.health - self.power
    player.update(:health => health)
  end

end
