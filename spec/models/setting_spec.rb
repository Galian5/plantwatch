require 'rails_helper'

RSpec.describe Setting, type: :model do
  describe 'associations' do
    it { should belong_to(:plant) }
  end
end
