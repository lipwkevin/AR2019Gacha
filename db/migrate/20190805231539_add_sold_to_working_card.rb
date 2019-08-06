class AddSoldToWorkingCard < ActiveRecord::Migration[5.2]
  def change
    add_column :working_cards, :sold, :boolean , default: false
    add_column :working_cards, :soldTime, :timestamp
    add_column :coasters, :sold, :boolean , default: false
    add_column :coasters, :soldTime, :timestamp
  end
end
