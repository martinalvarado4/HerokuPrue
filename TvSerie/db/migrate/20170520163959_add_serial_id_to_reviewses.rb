class AddSerialIdToReviewses < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewses, :serial_id, :integer
  end
end
