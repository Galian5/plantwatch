require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'associations' do
    it { should belong_to(:plant) }
  end
end
