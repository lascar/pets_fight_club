class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.datetime :birth_day
      t.string :robot_type
      t.integer :victory_rate, :default => 0

      t.timestamps null: false
    end
    add_index :robots, :name, unique: true
  end
end
