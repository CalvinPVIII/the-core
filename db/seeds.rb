# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
weapon = Weapon.create!(damage: 3, multiplyer: 2, debuff_effect: 'none',img: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6cf22b2a-3977-47de-a95d-456a19f071c5/dcfw3gq-19a987dc-dbeb-434d-86eb-82599559159a.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZjZjIyYjJhLTM5NzctNDdkZS1hOTVkLTQ1NmExOWYwNzFjNVwvZGNmdzNncS0xOWE5ODdkYy1kYmViLTQzNGQtODZlYi04MjU5OTU1OTE1OWEuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vBpPhGkyhIygdPkSYI64Ve8D16JmAUH24126oe8OZD8', level_id: nil )


Level.create!(name: Faker::Books::Lovecraft.location, location: 'north', weapon_id: weapon.id )
