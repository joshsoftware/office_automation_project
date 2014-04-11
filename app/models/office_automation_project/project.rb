module OfficeAutomationProject
  class Project
    include Mongoid::Document
    include AASM

    #Fields
    field :name
    field :description
    field :start_date, type: Date
    field :end_date, type: Date
    field :codeclimate_url
    field :status
    
    #Validation
    validates :name, :start_date, presence: true
    validates :name, uniqueness: true

    #Relationship
    embeds_many :attachments, class_name: 'OfficeAutomationEmployee::Attachment'
    belongs_to :company, class_name: 'OfficeAutomationEmployee::Company'

    embeds_many :contact_persons, class_name: 'OfficeAutomationProject::ContactPerson'
    has_many :project_members, class_name: 'OfficeAutomationProject::ProjectMember', dependent: :destroy
    belongs_to :client, class_name: 'OfficeAutomationProject::Client'

    accepts_nested_attributes_for :project_members

    # whiny_transition set to false for true/false response instead of exceptions
    # Default field is aasm_state we can specify field using column
    aasm column: 'status', whiny_transitions: false do
      state :pending, initial: true, before_enter: :send_email #To all admin of company
      state :active
      state :deactive
      state :completed
      state :maintainance
      state :close

      event :activate, after: :state_change do
        transitions from: [:pending, :deactive], to: :active
      end

      event :deactivate do
        transitions from: :active, to: :deactive
      end

      event :complete do
        transitions from: [:active, :deactive], to: :completed#, guard: :is_admin
      end

      event :maintain do
        transitions from: [:completed], to: :maintainance
      end

      event :close do
        transitions from: [:active, :deactive, :completed, :maintainance], to: :close
      end

    end

    def send_email
      puts "New Project has been created"
    end

    def state_change
      puts "State of project has been changed"
      puts "From: #{aasm.from_state} to #{aasm.to_state} "
    end

    #def is_admin
    #  p "You are not authorised to do this"
    #  false
    #end
  end

end
