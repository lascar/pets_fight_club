class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :age
      t.string :pet_type
      t.integer :victory_rate, :default => 0

      t.timestamps null: false
    end
    add_index :pets, :name, unique: true
  end
end
