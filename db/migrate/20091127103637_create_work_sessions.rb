class CreateWorkSessions < ActiveRecord::Migration
  def self.up
    create_table :work_sessions do |t|
      t.datetime :start
      t.datetime :end
      t.string :position
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :work_sessions
  end
end
