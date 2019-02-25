class Ability
  include CanCan::Ability

  
  
    def initialize(user)
      if user.admin?
        can :manage, :all
      else
        can [:update, :destroy, :read], User, id: user.id
      end
    end

end