class AddRatingToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :rating, :integer
  end
end
