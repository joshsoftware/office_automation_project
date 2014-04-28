module OfficeAutomationProject
  class ContactPerson
    include Mongoid::Document

    #Fields
    field :name
    field :primary_email_id
    field :secondary_email_id
    field :phone_no
    field :address
    field :skype_id
    field :linkedin_id
    field :twitter_id

    #Validations
    validates :name, :primary_email_id, :phone_no, presence: true
    validates :primary_email_id, :secondary_email_id, :phone_no, :skype_id, :linkedin_id, :twitter_id, {uniqueness: true, allow_blank: true}
    validates :primary_email_id, :secondary_email_id, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
    validates :phone_no, format: {with: /\+(?:[0-9]??){6,14}[0-9]/}

    #Relationships
    embedded_in :project, class_name: 'OfficeAutomationProject::Project'

  end
end
