class ChangeColumnNameAndTypePetsAge < ActiveRecord::Migration
  def change
     change_column :pets, :age, :datetime
     rename_column :pets, :age, :birth_day
  end
end
