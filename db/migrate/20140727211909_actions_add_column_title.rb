class ActionsAddColumnTitle < ActiveRecord::Migration
  def change
    add_column(:actions, :action_title, :string)
  end
end
