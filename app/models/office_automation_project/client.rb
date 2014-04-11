module OfficeAutomationProject
  class Client
    include Mongoid::Document

    #Fields
    field :name
    field :currency
    field :primary_email_id
    field :secondary_email_id
    field :phone_no
    field :address
    field :city
    field :state
    field :country
    field :pincode, type: Integer

    #Validations
    validates :name, :primary_email_id, :phone_no, :address, :city, :state, :country, :pincode, :currency, presence:true
    validates :primary_email_id, :secondary_email_id, :phone_no, uniqueness: true
    validates :pincode, numericality: true
    validates :primary_email_id, :secondary_email_id, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

    #Relationships
    has_many :projects, class_name: 'OfficeAutomationProject::Project'

  end
end
