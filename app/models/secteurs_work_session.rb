class SecteursWorkSession < ActiveRecord::Base
  belongs_to :secteur
  belongs_to :work_session
end
