class Action < ActiveRecord::Base
  belongs_to :issue
  
  validates_datetime :date
end
