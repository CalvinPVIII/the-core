class Player < ApplicationRecord
  belongs_to :weapon
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    player = Player.find_by "email = ?", email
    if player && player.password_hash == BCrypt::Engine.hash_secret(password, player.password_salt)
      player
    else
      nil
    end
  end

  def attack(mob_id)
    mob = Mob.find(mob_id)
    damage = self.weapon.damage * self.weapon.multiplyer + self.power
    mob.health - damage
    health = mob.health - damage
    mob.update(:health => health)
  end
















end
