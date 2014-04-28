module OfficeAutomationProject
  FactoryGirl.define do
    factory :client, class: Client do
      name "Abc solutions"
      currency "Indian"
      primary_email_id "abc@abc.com"
      secondary_email_id "abc1@abc.com"
      phone_no "+91 1234567890"
      address "shivajinagar"
      city "pune"
      state "maharashtra"
      country "india"
      pincode 1234
    end
  end
end

