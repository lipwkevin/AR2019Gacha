class AddCodeNameToWorkingCard < ActiveRecord::Migration[5.2]
  def change
    add_column :working_cards, :codeName, :string
    add_column :coasters, :codeName, :string
  end
end
