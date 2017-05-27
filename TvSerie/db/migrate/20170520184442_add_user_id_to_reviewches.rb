class AddUserIdToReviewches < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewches, :user_id, :integer
  end
end
