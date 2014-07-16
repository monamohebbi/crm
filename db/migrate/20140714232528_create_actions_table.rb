class CreateActionsTable < ActiveRecord::Migration
  def change
    create_table :actions do |table|
      table.string "name"
      table.datetime "date"
      table.text "text"
      table.timestamps
    end
  end
end
