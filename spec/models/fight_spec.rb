require 'rails_helper'
RSpec.describe Fight, :type => :model do
  let(:fight1) {FactoryGirl.create(:fight)}
  it { expect(subject).to validate_presence_of :pet1 }
  it { expect(subject).to validate_presence_of :pet2 }
  it { expect(subject).to validate_presence_of :win1 }
  it { expect(subject).to validate_presence_of :fight_time }
end
