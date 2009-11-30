class ChangeWorkSession < ActiveRecord::Migration
  def self.up
    remove_column :work_sessions, :timespan
    add_column :work_sessions, :timespan, :integer
  end

  def self.down
    remove_column :work_sessions, :timespan
    add_column :work_sessions, :timespan, :time
  end
end
