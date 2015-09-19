class Fight < ActiveRecord::Base
  belongs_to :robot1, :class_name => 'Robot', :foreign_key => 'robot1_id'
  belongs_to :robot2, :class_name => 'Robot', :foreign_key => 'robot2_id'
  validates_associated :robot1, :robot2
  validates :robot1, :robot2, :win1, :fight_time, presence: true
  before_save :verif_robots_users, :verif_fight_time
  after_save :update_victory_rate

  def robot_win
    id_win = self.win1 ? self.robot1_id : self.robot2_id
    Robot.find(id_win)
  end

  def robot_loose
    id_loose = self.win1 ? self.robot2_id : self.robot1_id
    Robot.find(id_loose)
  end

  private
  def update_victory_rate
    robot_win.update_attributes({victory_rate: robot_win.victory_rate + 1})
    robot_loose.update_attributes({victory_rate: robot_loose.victory_rate - 1})
  end

  def verif_robots_users
    if self.robot1.user_id == self.robot2.user_id
      errors.add(:base, :robots_owners_have_to_be_different)
      false 
    end
  end

  def verif_fight_time
    fight_robots_error = false
    fights = Fight.where('robot1_id = ? or robot1_id = ? or robot2_id = ? or robot2_id = ?', self.robot1_id, self.robot2_id, self.robot1_id, self.robot2_id).distinct
    fights.each do |fight|
      fight_robots_error = compare_fight_times(fight.fight_time)
      fight_robots_error && break
    end
    return false if fight_robots_error
  end

  def compare_fight_times(fight_time)
    if fight_time > self.fight_time - 1.days
      puts 'fight_time > self.fight_time - 1.days'
      self.errors[:fight_time] << 'robot can not fight twice a day'
      true
    else
      false
    end
  end

end
