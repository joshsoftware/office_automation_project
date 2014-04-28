module OfficeAutomationProject
  FactoryGirl.define do
    factory :project, class: Project do
      name "intranet"
      description "Intranet for company"
      start_date "10/01/2013"
      status "Pending"
      client
      contact_persons { [FactoryGirl.build(:contact_person)]}
    end
  end
end

