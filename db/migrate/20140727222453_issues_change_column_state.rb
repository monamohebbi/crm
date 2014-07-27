class IssuesChangeColumnState < ActiveRecord::Migration
  def change
    remove_column(:issues, :state)
    add_column(:issues, :aasm_state, :string, :default => "open")
  end
end
