module OfficeAutomationProject
  class Project
    include Mongoid::Document
    #Fields
    field :project_name
    field :description
    field :start_date, type: Date
    field :end_date, type: Date
    field :codeclimate
    field :status

    #Validations
    validates :project_name, :start_date, :status, presence: true
    validates :status, inclusion: { in: %w(Active Deactive Pending Completed)}

    #Relationship
    embeds_many :attachments, class_name: 'OfficeAutomationEmployee::Attachment'
    belongs_to :company, class_name: 'OfficeAutomationEmployee::Company'

    has_many :projectmembers, class_name: 'OfficeAutomationProject::ProjectMember', dependent: :destroy
    has_one :client, class_name: 'OfficeAutomationProject::Client', dependent: :destroy
  end
end
