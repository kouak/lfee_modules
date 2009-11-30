class CreateSecteurs < ActiveRecord::Migration
  def self.up
    create_table :secteurs do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :secteurs
  end
end
