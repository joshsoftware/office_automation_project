module OfficeAutomationProject
  class ContactPerson
    include Mongoid::Document
    
    #Fields
    field :name
    field :primary_email_id
    field :secondary_email_id
    field :phone_no, type: Integer

    #Validations
    validates :name, :primary_email_id, :phone_no, presence: true
    validates :phone_no, {numericality: true, length: {minimum: 10, maxmimum: 13}}

    #Relationships
    embeds_one :contact_person_address, class_name: 'OfficeAutomationEmployee::Address'
    embedded_in :client, class_name: 'OfficeAutomationProject::Client'

  end
end
