class RenameHowtomakeidColumnToHowtomakes < ActiveRecord::Migration[5.2]
  def change
    rename_column :howtomakes, :howtomake_id, :item_id
  end
end
