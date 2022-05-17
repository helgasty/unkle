require 'rails_helper'

RSpec.describe Subscription, type: :model do

  context 'validations' do
    it 'check date valid' do
      contract = create(:contract)
      user = create(:user, :user)

      expect(Subscription.new(contract: contract, user: user, subscribed_at: Date.today, end_subscription_at: Date.today - 1.days).valid?).to be(false)
      expect(Subscription.new(contract: contract, user: user, subscribed_at: Date.today, end_subscription_at: Date.today).valid?).to be(true)
      expect(Subscription.new(contract: contract, user: user, subscribed_at: Date.today, end_subscription_at: Date.today + 1.days).valid?).to be(true)
    end
  end
end