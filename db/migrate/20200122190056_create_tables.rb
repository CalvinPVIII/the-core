class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :power
      t.integer :health
      t.integer :weapon_id
      t.integer :level_id
      t.boolean :n_stat
      t.boolean :s_stat
      t.boolean :e_stat
      t.boolean :w_stat
      t.string :img
      t.column :email, :string
     t.column :password_hash, :string
     t.column :password_salt, :string
    end
    create_table :mobs do |t|
      t.string :name
      t.integer :power
      t.integer :health
      t.integer :level_id
      t.string :img
    end
    create_table :weapons do |t|
      t.string :name
      t.integer :damage
      t.integer :multiplyer
      t.string :debuff_effect
      t.string :img
      t.integer :player_id
    end
    create_table :levels do |t|
      t.string :name
      t.string :location
      t.integer :weapon_id
      t.string :img
    end
  end
end
