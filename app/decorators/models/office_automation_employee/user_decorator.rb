OfficeAutomationEmployee::User.class_eval do
  has_many :project_members, class_name: 'OfficeAutomationProject::ProjectMember', dependent: :destroy
end
