class AddRatingToReviewches < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewches, :rating, :integer, default: 0
  end
end
