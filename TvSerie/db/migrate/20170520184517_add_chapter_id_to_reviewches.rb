class AddChapterIdToReviewches < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewches, :chapter_id, :integer
  end
end
