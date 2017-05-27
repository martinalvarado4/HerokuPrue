class CreateReviewses < ActiveRecord::Migration[5.0]
  def change
    create_table :reviewses do |t|
      t.text :comentario

      t.timestamps
    end
  end
end
