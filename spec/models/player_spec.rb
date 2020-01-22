require 'rails_helper'

describe Player do

it ("automates an attack on a mob")do
 new_weapon = Weapon.create!(damage: 3, multiplyer: 2, debuff_effect: 'fire',img: 'url=weaponimage.com', player_id: nil )
new_player = Player.create!(name: "Hero", power: 2, health: 100,img: 'url=weaponimage.com', weapon_id: new_weapon.id, email: 'horse@horsey.com')
new_level = Level.create!(name: 'Hell World', location: 'W', weapon_id: new_weapon.id)
new_mob = Mob.create!(name:"Villain", power:2, health: 25, level_id: new_level.id)
new_player.attack(new_mob.id)
expect(Mob.find(new_mob.id).health).to(eq(17))
end









end
