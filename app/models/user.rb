class User < ActiveRecord::Base
  # associations
  belongs_to :equipe
  belongs_to :promotion
  belongs_to :role
  has_many :work_sessions
  
  # behaviors
  acts_as_authentic
  
  
  # Nom, prenom validation
  validates_presence_of :nom, :prenom
  validates_length_of :nom, :prenom, :maximum => 30
  validates_uniqueness_of :nom, :case_sensitive => false
  
  # Username validation
  validates_uniqueness_of :username, :allow_nil => true, :allow_blank => true
  validates_length_of :username, :in => 4..30, :allow_nil => true, :allow_blank => true
  
  def role_symbols
    if role
      [role.to_sym]
    else
      [:user]
    end
  end
  
  def to_label
    prenom.titleize + ' ' + nom.upcase
  end
  
  def to_s
    prenom.titleize + ' ' + nom.upcase
  end
end
