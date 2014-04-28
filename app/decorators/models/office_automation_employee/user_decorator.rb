OfficeAutomationEmployee::User.class_eval do
  has_many :project_members, class_name: 'OfficeAutomationProject::ProjectMember', dependent: :destroy
  
  def assigned_to_project?
    @project_members1 = self.project_members.collect(&:project_id) if self.project_members
    (@project_members1.length > 0) ? true : false
  end

  def project_list
    self.project_members.collect(&:project) if self.project_members
  end

  def is_manager?
    (self.project_members.collect(&:is_manager).include? (true)) ? true : false
  end

end
