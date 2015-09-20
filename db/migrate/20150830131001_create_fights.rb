class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :robot1_id
      t.integer :robot2_id
      t.boolean :win1
      t.datetime :fight_time

      t.timestamps null: false
    end
  end
end
