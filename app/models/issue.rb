class Issue < ActiveRecord::Base
  has_many :actions
  include AASM

  aasm do # default column: aasm_state
    state :open, :initial => true
    state :closed
  end

end
