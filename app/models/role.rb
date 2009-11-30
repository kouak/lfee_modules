class Role < ActiveRecord::Base
  has_many :users
  
  def to_s
    name
  end
  
  def to_sym
    to_s.underscore.to_sym
  end
end
