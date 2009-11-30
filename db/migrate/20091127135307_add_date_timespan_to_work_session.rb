class AddDateTimespanToWorkSession < ActiveRecord::Migration
  def self.up
    add_column :work_sessions, :date, :date
    add_column :work_sessions, :timespan, :time
    remove_column :work_sessions, :start
    remove_column :work_sessions, :end
  end

  def self.down
    remove_column :work_sessions, :timespan
    remove_column :work_sessions, :date
    add_column :work_sessions, :start, :datetime
    add_column :work_sessions, :end, :datetime
  end
end
