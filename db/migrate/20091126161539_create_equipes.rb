class CreateEquipes < ActiveRecord::Migration
  def self.up
    create_table :equipes do |t|
      t.integer :equipe

      t.timestamps
    end
    rename_column :users, :equipe, :equipe_id
  end

  def self.down
    drop_table :equipes
    rename_column :users, :equipe_id, :equipe
  end
end
