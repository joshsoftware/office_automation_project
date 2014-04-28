module OfficeAutomationEmployee
  FactoryGirl.define do
    factory :company, class: Company do
      name "Josh" 
      company_url "http://www.josh.com"
      registration_date "01/01/2007"
      registered_address { FactoryGirl.build(:registered_address) }
      current_address { FactoryGirl.build(:current_address) }
      roles Role.all
      status "Active"
      #clients
      #factory :company_with_clients do
      #  ignore do
      #    clients_count 5
      #  end
      #  after(:create) do |company, evaluator|
      #    create_list(:client, evaluator.clients_count, company: company)
      #  end
      #end
    end
  end
end
