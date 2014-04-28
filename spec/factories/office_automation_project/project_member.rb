module OfficeAutomationProject
  FactoryGirl.define do
    factory :project_member, class: ProjectMember do
      is_manager "true"
      user
      project
    end
  end
end

