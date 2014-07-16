class ActionsAddColumnIssueId < ActiveRecord::Migration
  def change
    add_column(:actions, :issue_id, :integer)
    add_column(:issues, :state, :string)
  end
end
