class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :read, [Request, Schedule]
    elsif user.pilot?
      can :manage, Notification
      can [:create, :read], Request
      can :read, Schedule
    elsif user.air_traffic_officer?
      can :manage, Notification
      can [:update, :read], Request
      can :update, Schedule
    end
  end
end
