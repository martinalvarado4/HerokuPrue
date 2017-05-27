class CreateNoticions < ActiveRecord::Migration[5.0]
  def change
    create_table :noticions do |t|
      t.text :titulo
      t.text :contenido
      t.string :tipo

      t.timestamps
    end
  end
end
