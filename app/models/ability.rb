# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
 
    #
    #   user ||= User.new # guest user (not logged in)
      if user.isStaff?
        can :manage, :all
    #   else
    #     can :read, :all
      end
      alias_action(:create, :read, :update,:delete, to: :crud)
      can (:crud), Review do |review|
        user == review.user
      end
  
      can :destroy, Favourite do |favourite|
        favourite.user == user
      end

  end
end
