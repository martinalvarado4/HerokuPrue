class AddSerialIdToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :serial_id, :integer
  end
end
