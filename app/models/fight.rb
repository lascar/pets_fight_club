class Fight < ActiveRecord::Base
  belongs_to :pet1, :class_name => 'Pet', :foreign_key => 'pet1_id'
  belongs_to :pet2, :class_name => 'Pet', :foreign_key => 'pet2_id'
  belongs_to :pet_win, :class_name => 'Pet', :foreign_key => 'pet_win_id'
  validates :pet1, :pet2, :fight_time, :pet_win, presence: true
  before_save :verif_pets, :verif_fight_time
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

  def verif_pets
    if self.pet1.user_id == self.pet2.user_id
      errors[:base] << 'pets owners have to be different'
      false 
    end
  end

  def verif_fight_time
    fight_pets_error = false
    fights = Fight.where('pet1_id = ? or pet1_id = ? or pet2_id = ? or pet2_id = ?', self.pet1_id, self.pet2_id, self.pet1_id, self.pet2_id).distinct
    fights.each do |fight|
      fight_pets_error = compare_fight_times(fight.fight_time)
      fight_pets_error && break
    end
    return false if fight_pets_error
  end

  def compare_fight_times(fight_time)
    if fight_time > self.fight_time - 1.days
      puts 'fight_time > self.fight_time - 1.days'
      errors[:base] << 'pet can not fight twice a day'
      true
    else
      false
    end
  end
end
