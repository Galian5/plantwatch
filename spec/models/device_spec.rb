require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:plants) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
  end
end
