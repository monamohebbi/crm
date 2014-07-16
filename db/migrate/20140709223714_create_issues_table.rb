class CreateIssuesTable < ActiveRecord::Migration
  def change
    create_table :issues do |table|
      table.string :customer_name 
      table.string :issue_title
      table.string :received_by
      table.string :assigned_to
      table.datetime :assigned_date
    end
  end
end
