class WorkSession < ActiveRecord::Base
  belongs_to :user
  has_many :secteurs_work_sessions
  has_many :secteurs, :through => :secteurs_work_sessions
  
  # date
  validates_presence_of :date
  validate :date_validation
  def date_validation
    if !date.is_a?(Date)
      errors.add(:date, 'invalide')
    elsif !((Date.today() <=> date) >= 0) # date in the pass
      errors.add(:date, 'doit être dans le passé') # only validates date in the past
    end
  end
  
  # Timespan
  validates_presence_of :timespan
  validates_inclusion_of :timespan, :in => (15*60)..(8*4*15*60)
  
  # User
  validates_presence_of :user
  
  # Position
  validates_presence_of :position # only useful for formtastic
  validates_format_of :position, :with => /\AC[RO]\Z/

  
  # Secteurs
  validates_presence_of :secteurs
  
end
