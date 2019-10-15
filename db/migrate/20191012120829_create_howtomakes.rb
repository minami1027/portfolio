class CreateHowtomakes < ActiveRecord::Migration[5.2]
  def change
    create_table :howtomakes do |t|
      t.integer :howtomake_id
      t.text :howtomake

      t.timestamps
    end
  end
end
