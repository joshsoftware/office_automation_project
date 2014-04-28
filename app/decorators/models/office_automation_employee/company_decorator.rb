OfficeAutomationEmployee::Company.class_eval do
  has_many :projects, class_name: 'OfficeAutomationProject::Project', dependent: :destroy
  has_many :clients, class_name: 'OfficeAutomationProject::Client', dependent: :destroy
end
