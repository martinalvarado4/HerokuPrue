class AddUserIdToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :user_id, :integer
  end
end
