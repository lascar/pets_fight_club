require 'rails_helper'
RSpec.describe Fight, :type => :model do
  let(:user1) {FactoryGirl.create(:user)}
  let(:robot1) {FactoryGirl.create(:robot, user: user1)}
  let(:robot2) {FactoryGirl.create(:robot, user: user1)}
  let(:fight1) {FactoryGirl.build(:fight, robot1: robot1, robot2: robot2)}
  it { expect(subject).to validate_presence_of :robot1 }
  it { expect(subject).to validate_presence_of :robot2 }
  it { expect(subject).to validate_presence_of :win1 }
  it { expect(subject).to validate_presence_of :fight_time }
  it 'does not allow for robots\'s owners to be the same one' do
    fight1.save
    expect(fight1.errors.added?(:base, :robots_owners_have_to_be_different)).to eq(true)
  end
end
