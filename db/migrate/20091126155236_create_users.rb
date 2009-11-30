class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :nom
      t.string :prenom
      t.string :email
      t.integer :equipe
      t.date :affectation
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
