class CreateSecteursWorkSessions < ActiveRecord::Migration
  def self.up
    create_table :secteurs_work_sessions do |t|
      t.integer :secteur_id
      t.integer :work_session_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :secteurs_work_sessions
  end
end
