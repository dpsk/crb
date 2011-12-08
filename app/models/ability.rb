class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :create, Advert
      can :manage, Advert, user_id: user.id
    else
      can :read, :all
    end
  end
end
