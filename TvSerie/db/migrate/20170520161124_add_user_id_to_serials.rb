class AddUserIdToSerials < ActiveRecord::Migration[5.0]
  def change
    add_column :serials, :user_id, :integer
  end
end
