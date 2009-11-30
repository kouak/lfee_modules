class Equipe < ActiveRecord::Base
  has_many :users
  default_scope :order => 'equipe ASC'
  def to_label
    self.to_s
  end
  def to_s
    equipe.to_s
  end
  def to_i
    equipe
  end
end
