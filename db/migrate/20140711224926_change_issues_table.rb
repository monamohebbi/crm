class ChangeIssuesTable < ActiveRecord::Migration
  def change
    change_column(:issues, :assigned_date, :datetime, :default=>Time.now)
    add_column(:issues, :created_at, :datetime)
    add_column(:issues, :updated_at, :datetime)

  end
end
