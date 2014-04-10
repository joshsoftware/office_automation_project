Rails.application.routes.draw do

  mount OfficeAutomationProject::Engine => "/office_automation_project"
  root to: 'office_automation_employee/companies#show'
end
