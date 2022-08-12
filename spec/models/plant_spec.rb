require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:device) }
    it { should have_many(:measurements) }
    it { should have_one(:schedule) }
    it { should have_one(:setting) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:device_id) }
    it { should validate_presence_of(:user_id) }
  end
end
