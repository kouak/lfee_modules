class Promotion < ActiveRecord::Base
  has_many :users
  validates_presence_of :name
  validates_format_of :name, :with => /\A[0-9]{2}[a-f]\Z/i
  validates_uniqueness_of :name, :case_sensitive => false
  
  validates_presence_of :affectation

  
  default_scope :order => 'name ASC'
  
  def to_label
    self.name
  end
  
  def to_s
    name
  end
end
