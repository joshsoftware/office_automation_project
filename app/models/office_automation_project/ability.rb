module OfficeAutomationProject
  class Ability < OfficeAutomationEmployee::Ability

    def initialize(current_user)
      if current_user.role? OfficeAutomationEmployee::Role::ADMIN
        can [:create], Project

        can [:update, :edit, :index, :show], Project, company: current_user.company


        can [:create], Client
        can [:update, :edit, :index, :show], Client, company: current_user.company

      else

        can [:show, :index], Project do |project|
          p current_user.project_list
          current_user.project_list.collect(&:id).include? (project.id)
        end

        if current_user.is_manager?
          can [:edit, :update], Project do |project|
            project.managers.collect(&:user_id).include? (current_user.id)
          end
        end
      end

      # Define abilities for the passed in user here. For example:
      #
      #   user ||= User.new # guest user (not logged in)
      #   if user.admin?
      #     can :manage, :all
      #   else
      #     can :read, :all
      #   end
      #
      # The first argument to `can` is the action you are giving the user 
      # permission to do.
      # If you pass :manage it will apply to every action. Other common actions
      # here are :read, :create, :update and :destroy.
      #
      # The second argument is the resource the user can perform the action on. 
      # If you pass :all it will apply to every resource. Otherwise pass a Ruby
      # class of the resource.
      #
      # The third argument is an optional hash of conditions to further filter the
      # objects.
      # For example, here the user can only update published articles.
      #
      #   can :update, Article, :published => true
      #
      # See the wiki for details:
      # https://github.com/ryanb/cancan/wiki/Defining-Abilities
      super
    end
  end
end
