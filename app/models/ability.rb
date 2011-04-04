class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    # Start with too-simple setup just to get cancan working:
    if user.permission > 8.0
      can :manage, :all  # manage means all actions
    else
      can :manage, Authentication do |authentication|
        authentication.try(:user) == user
      end
      can :read, Clipping
      can :read, Colleague
      can :read, Community
      can :read, Faq
      can :read, Link
      can :read, PastRanking
      can :read, Presentation
      can :read, Proposal
      can :read, Pub
      can :read, Ranking
      can :read, Video
      can :home_page, Community
      can :horserace, Community
      can :search, Community
    end
  end
end