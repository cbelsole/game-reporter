class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
      elsif user.host?
        can :manage, :game
      else
        can :read, :game
      end
  end
end
