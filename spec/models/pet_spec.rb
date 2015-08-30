require 'rails_helper'

RSpec.describe Pet, :type => :model do
  it { expect(subject).to have_db_index(:name) }

  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_uniqueness_of(:name) }
  it { expect(subject).to_not allow_value(' ').for(:name) }

end
