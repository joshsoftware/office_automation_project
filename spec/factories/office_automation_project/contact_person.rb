module OfficeAutomationProject
  FactoryGirl.define do
    factory :contact_person, class: ContactPerson do
      name Faker::Name.name
      primary_email_id Faker::Internet.email
      secondary_email_id Faker::Internet.email
      phone_no Faker::Number.number(10)
      address "pune"
      skype_id Faker::Name.name
      linkedin_id Faker::Name.name
      twitter_id Faker::Name.name
    end
  end
end

