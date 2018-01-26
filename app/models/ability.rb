class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :profile, User

    if user.is_role? 'superadmin'
      can :manage, :all
    end

    if user.is_role? 'admin'
      can :manage, Category
      can :manage, Product
    end

    if user.is_role? 'member'
      can :read, Category
      can :read, Product
    end
  end
end
