class AddUsersVistos < ActiveRecord::Migration[5.0]
  def self.up
    create_table :users_vistos, :id => false do |t|
      t.integer :user_id
      t.integer :visto_id
    end
  end

  def self.down
    drop_table :users_vistos
  end
end
