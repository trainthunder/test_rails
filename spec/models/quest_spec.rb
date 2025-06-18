require 'rails_helper'

RSpec.describe Quest, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it 'is valid' do
      quest = Quest.new(title: 'Git 101', status: false)
      expect(quest).to be_valid
    end

    it 'is not valid' do
      quest = Quest.new(title: nil, status: false)
      expect(quest).to_not be_valid
    end
  end
end
