class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :fights
  validates :name, presence: true, uniqueness: true
  
  
  def age
    Time.now - self.birth_day
    (Time.now.to_s(:number).to_i - birth_day.to_s(:number).to_i)/10e9.to_i
  end
end
