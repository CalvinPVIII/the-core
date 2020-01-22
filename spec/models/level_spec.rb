require 'rails_helper'


describe Level do
  it ("Spawns a mob creature") do
    new_weapon = Weapon.create!(damage: 3, multiplyer: 2, debuff_effect: 'fire',img: 'url=weaponimage.com', player_id: nil )
   new_level = Level.create!(name: 'Hell World', location: 'W', weapon_id: new_weapon.id)
   new_level.spawn_mobs
   expect(Mob.all).not_to(eq([]))
  end
end
