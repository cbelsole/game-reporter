class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
      elsif user.host?
        can :manage, [Game, Room, Table]
      else
        can :read, [Game, Room, Table]
      end
  end
end
