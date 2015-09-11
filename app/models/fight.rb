class Fight < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :pet1, :class_name => 'Pet', :foreign_key => 'pet1_id'
  belongs_to :pet2, :class_name => 'Pet', :foreign_key => 'pet2_id'
  belongs_to :pet_win, :class_name => 'Pet', :foreign_key => 'pet_win_id'
  validates :pet1, :pet2, :fight_time, :pet_win, presence: true
  validates_with FightValidator
  after_save :update_victory_rate

  private
  def update_victory_rate
    pet = Pet.find(self.pet_win_id)
    victory_rate = pet.victory_rate + 1
    pet.update_attributes({victory_rate: victory_rate})
    pet = Pet.find(self.pet_win_id == pet1_id ? pet2_id : pet1_id)
    victory_rate = pet.victory_rate - 1
    pet.update_attributes({victory_rate: victory_rate})
  end
end
