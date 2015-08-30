class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :pet1_id
      t.integer :pet2_id
      t.integer :pet_win_id
      t.datetime :fight_time

      t.timestamps null: false
    end
  end
end
