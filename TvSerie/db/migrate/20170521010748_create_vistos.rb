class CreateVistos < ActiveRecord::Migration[5.0]
  def change
    create_table :vistos do |t|

      t.timestamps
    end
  end
end
