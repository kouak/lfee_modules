class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.string :name
      t.date :affectation

      t.timestamps
    end
    remove_column :users, :affectation
    add_column :users, :promotion_id, :integer
  end

  def self.down
    drop_table :promotions
    remove_column :users, :promotion_id
    add_column :users, :affectation, :date
  end
end
