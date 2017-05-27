class AddUserIdToReviewses < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewses, :user_id, :integer
  end
end
