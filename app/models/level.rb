class Level < ApplicationRecord
  has_many :mobs
  belongs_to :weapon



def spawn_mobs
    rand(1..8).times do
    Mob.create!(name: Faker::Games::ElderScrolls.creature, power: rand(1..5), health: rand(10..50), level_id: self.id, img:["https://cdn140.picsart.com/268986468003211.png?r1024x1024", "https://mir-s3-cdn-cf.behance.net/project_modules/disp/9da20421691741.5630659436bbd.png", "https://thecreativeextreme.com/wp-content/uploads/2017/07/Mikrotero-Creature-single.png", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDFYNIKXdK5DIpj4jrdScUnTDB9AjhxrgVl5rWXGYUBUGK2IXM&s", "https://s19.postimg.cc/5n0v3wbw3/mimic_book.png", "https://officialpsds.com/imageview/72/8n/728npx_large.png?1521316482", "https://i.pinimg.com/originals/ca/ae/07/caae07d7ea6258705164b5ee16bb05e5.png", "https://www.totalwine.com/dynamic/490x/media/sys_master/twmmedia/h29/h14/10979435577374.png", "http://www.ihstattler.com/wp/wp-content/uploads/2016/10/Eye-Creature-Copy-joseph-yoon.png", "https://images.fineartamerica.com/images/artworkimages/medium/1/rainbow-unicorn-clouds-and-stars-crista-forest-transparent.png"].sample)
    end
end










end
