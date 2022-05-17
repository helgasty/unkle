class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
    else
      can :list, Option
      can :my_account, User
      can :my_contracts, Contract
      can :subscribe, Contract
      can :unsubscribe, Contract
    end
  end
end
