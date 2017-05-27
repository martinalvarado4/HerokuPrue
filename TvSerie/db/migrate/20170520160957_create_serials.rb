class CreateSerials < ActiveRecord::Migration[5.0]
  def change
    create_table :serials do |t|
      t.string :genero
      t.integer :ano
      t.text :titulo
      t.text :descripcion
      t.integer :rating

      t.timestamps
    end
  end
end
