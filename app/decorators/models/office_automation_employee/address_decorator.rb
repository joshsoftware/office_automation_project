OfficeAutomationEmployee::Address.class_eval do
  embedded_in :client_address, class_name: 'OfficeAutomationProject::Client'
  embedded_in :contact_person_address, class_name: 'OfficeAutomationProject::ContactPerson'
end

