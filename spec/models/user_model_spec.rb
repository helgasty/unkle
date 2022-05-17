require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations' do
    it 'check email presence' do
      user = build(:user, email: nil)
      expect(user.valid?).to be(false)
    end

    it 'check password presence' do
      user = build(:user, password: nil)
      expect(user.valid?).to be(false)
    end
  end
end