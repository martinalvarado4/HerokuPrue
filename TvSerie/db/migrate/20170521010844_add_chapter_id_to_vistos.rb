class AddChapterIdToVistos < ActiveRecord::Migration[5.0]
  def change
    add_column :vistos, :chapter_id, :integer
  end
end
