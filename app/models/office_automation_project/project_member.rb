module OfficeAutomationProject
  class ProjectMember
    include Mongoid::Document
    
    #Fields
    field :is_manager, type: Mongoid::Boolean

    #Relationship
    belongs_to :user, class_name: 'OfficeAutomationEmployee::User'
    belongs_to :project, class_name: 'OfficeAutomationProject::Project'
 
  end
end
