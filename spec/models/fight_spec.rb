require 'rails_helper'
RSpec.describe Fight, :type => :model do
  let(:user1) {FactoryGirl.create(:user)}
  let(:pet1) {FactoryGirl.create(:pet, user: user1)}
  let(:pet2) {FactoryGirl.create(:pet, user: user1)}
  let(:fight1) {FactoryGirl.build(:fight, pet1: pet1, pet2: pet2)}
  it { expect(subject).to validate_presence_of :pet1 }
  it { expect(subject).to validate_presence_of :pet2 }
  it { expect(subject).to validate_presence_of :win1 }
  it { expect(subject).to validate_presence_of :fight_time }
  it 'does not allow for pets\'s owners to be the same one' do
    fight1.save
    expect(fight1.errors.added?(:base, :pets_owners_have_to_be_different)).to eq(true)
  end
end
