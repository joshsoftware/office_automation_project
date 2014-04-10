OfficeAutomationEmployee::Attachment.class_eval do
  embedded_in :projects, class_name: 'OfficeAutomationProject::Project'
end
