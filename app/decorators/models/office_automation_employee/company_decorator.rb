OfficeAutomationEmployee::Company.class_eval do
  has_many :projects, class_name: 'OfficeAutomationProject::Project', dependent: :destroy
end
