class AddSerialIdToNoticions < ActiveRecord::Migration[5.0]
  def change
    add_column :noticions, :serial_id, :integer
  end
end
