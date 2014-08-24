class Ability
  include CanCan::Ability

  def initialize(user)

  	user ||= User.new

  	if user.persisted?
      can :manage, :all
  	end
  end
end