require 'rails_helper'
require 'devise'
require "cancan/matchers"

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "check abilities" do
    it "for user role" do
      user = create(:user, :user)
      sign_in user

      ability = Ability.new(user)
      expect(ability).not_to be_able_to(:create, User)
      expect(ability).to be_able_to(:my_account, User)
      expect(ability).not_to be_able_to(:show, User)
      expect(ability).not_to be_able_to(:list, User)
      expect(ability).not_to be_able_to(:destroy, User)
    end

    it "for admin role" do
      user = create(:user, :admin)
      sign_in user

      ability = Ability.new(user)
      expect(ability).to be_able_to(:create, User)
      expect(ability).to be_able_to(:my_account, User)
      expect(ability).to be_able_to(:show, User)
      expect(ability).to be_able_to(:list, User)
      expect(ability).to be_able_to(:destroy, User)
    end
  end
end