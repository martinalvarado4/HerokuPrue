class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :largo
      t.integer :numero
      t.text :descripcion

      t.timestamps
    end
  end
end
