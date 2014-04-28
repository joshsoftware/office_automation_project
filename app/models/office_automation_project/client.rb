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
    validates :name, :primary_email_id, :secondary_email_id, :phone_no, :address, :city, :state, :country, :pincode, :currency, presence: true
    validates :name, :primary_email_id, :secondary_email_id, :phone_no, uniqueness: {scope: :company}
    validates :pincode, numericality: true
    validates :primary_email_id, :secondary_email_id, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

    #Relationships
    has_many :projects, class_name: 'OfficeAutomationProject::Project'
    belongs_to :company, class_name: 'OfficeAutomationEmployee::Company'
    
    def full_address 
      "#{self.address} \n #{self.city.humanize}, #{self.state.humanize} \n #{self.country}, #{self.pincode}"
    end
  end
end
