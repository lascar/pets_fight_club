class FightValidator < ActiveModel::Validator
  def validate(record)
    return (verif_pets(record) & verif_fight_time(record))
  end

  private
  def verif_pets(record)
    if record.pet1.user_id == record.pet2.user_id
      record.errors[:base] << 'pets owners have to be different'
      false 
    end
  end

  def verif_fight_time(record)
    fight_pets_error = false
    fights = Fight.where('pet1_id = ? or pet1_id = ? or pet2_id = ? or pet2_id = ?', record.pet1_id, record.pet2_id, record.pet1_id, record.pet2_id).distinct
    fights.each do |fight|
      fight_pets_error = compare_fight_times(fight.fight_time, record)
      fight_pets_error && break
    end
    return false if fight_pets_error
  end

  def compare_fight_times(fight_time, record)
    if fight_time > record.fight_time - 1.days
      puts 'fight_time > self.fight_time - 1.days'
      record.errors[:fight_time] << 'pet can not fight twice a day'
      true
    else
      false
    end
  end

end
