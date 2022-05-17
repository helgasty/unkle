require 'rails_helper'
require 'devise'
require "cancan/matchers"

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "check abilities" do
    it "for user role" do
      user = create(:user, :user)
      sign_in user

      ability = Ability.new(user)
      expect(ability).not_to be_able_to(:create, Contract)
      expect(ability).to be_able_to(:my_contracts, Contract)
      expect(ability).not_to be_able_to(:list, Contract)
      expect(ability).not_to be_able_to(:show, Contract)
      expect(ability).to be_able_to(:subscribe, Contract)
      expect(ability).to be_able_to(:unsubscribe, Contract)
    end

    it "for admin role" do
      user = create(:user, :admin)
      sign_in user

      ability = Ability.new(user)
      expect(ability).to be_able_to(:create, Contract)
      expect(ability).to be_able_to(:my_contracts, Contract)
      expect(ability).to be_able_to(:list, Contract)
      expect(ability).to be_able_to(:show, Contract)
      expect(ability).to be_able_to(:subscribe, Contract)
      expect(ability).to be_able_to(:unsubscribe, Contract)
    end
  end
end
