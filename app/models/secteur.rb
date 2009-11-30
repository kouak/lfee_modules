class Secteur < ActiveRecord::Base
  has_many :secteurs_work_sessions
  has_many :work_sessions, :through => :secteurs_work_sessions
  
  def to_s
    self.name
  end
end
