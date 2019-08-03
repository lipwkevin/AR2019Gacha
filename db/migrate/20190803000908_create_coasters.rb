class CreateCoasters < ActiveRecord::Migration[5.2]
  def change
    create_table :coasters do |t|
      t.string :name

      t.timestamps
    end
  end
end
