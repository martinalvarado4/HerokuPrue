class CreateReviewches < ActiveRecord::Migration[5.0]
  def change
    create_table :reviewches do |t|
      t.text :comentario

      t.timestamps
    end
  end
end
