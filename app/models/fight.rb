class Fight < ActiveRecord::Base
  belongs_to :pet1, :class_name => 'Pet', :foreign_key => 'pet1_id'
  belongs_to :pet2, :class_name => 'Pet', :foreign_key => 'pet2_id'
  validates_associated :pet1, :pet2
  validates :pet1, :pet2, :win1, :fight_time, presence: true
  before_save :verif_pets_users, :verif_fight_time
  after_save :update_victory_rate

  def pet_win
    id_win = self.win1 ? self.pet1_id : self.pet2_id
    Pet.find(id_win)
  end

  def pet_loose
    id_loose = self.win1 ? self.pet2_id : self.pet1_id
    Pet.find(id_loose)
  end

  private
  def update_victory_rate
    pet_win.update_attributes({victory_rate: pet_win.victory_rate + 1})
    pet_loose.update_attributes({victory_rate: pet_loose.victory_rate - 1})
  end

  def verif_pets_users
    if self.pet1.user_id == self.pet2.user_id
      self.errors[:base] << 'pets owners have to be different'
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
      self.errors[:fight_time] << 'pet can not fight twice a day'
      true
    else
      false
    end
  end

end
