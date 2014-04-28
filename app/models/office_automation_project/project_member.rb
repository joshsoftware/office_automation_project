module OfficeAutomationProject
  class ProjectMember
    include Mongoid::Document
    
    field :is_manager, type: Mongoid::Boolean
    
    belongs_to :user, class_name: 'OfficeAutomationEmployee::User'
    belongs_to :project, class_name: 'OfficeAutomationProject::Project'

    validates :user_id, uniqueness: {scope: :project}
    validates :user_id, :project_id, presence: true

  end
end
