module OfficeAutomationProject
  class Client
    include Mongoid::Document

    #Fields
    field :name
    field :currency
    field :primary_email_id
    field :secondary_email_id
    field :phone_no, type: Integer

    #Validations
    validates :name, :primary_email_id, presence:true
    validates :phone_no, {numericality: true, length: {minimum: 10, maximum: 13}}

    #Relationships
    embeds_one :client_address, class_name: 'OfficeAutomationEmployee::Address'
    embeds_many :contactpersons, class_name: 'OfficeAutomationProject::ContactPerson'
    belongs_to :project, class_name: 'OfficeAutomationProject::Project'

  end
end
