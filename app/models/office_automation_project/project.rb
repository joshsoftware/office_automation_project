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
    validates :name, :start_date, :client_id, presence: true
    validates :name, uniqueness: {scope: :company}

    #Relationship
    embeds_many :attachments, class_name: 'OfficeAutomationEmployee::Attachment'
    belongs_to :company, class_name: 'OfficeAutomationEmployee::Company'

    embeds_many :contact_persons, class_name: 'OfficeAutomationProject::ContactPerson'
    has_many :project_members, class_name: 'OfficeAutomationProject::ProjectMember', dependent: :destroy
    belongs_to :client, class_name: 'OfficeAutomationProject::Client'

    accepts_nested_attributes_for :project_members
    accepts_nested_attributes_for :contact_persons


    before_save :has_unique_user

    # whiny_transition set to false for true/false response instead of exceptions
    # Default field is aasm_state we can specify field using column
    aasm column: 'status', whiny_transitions: false do
      state :pending, initial: true#, before_enter: :send_email To all admin of company
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

    def state_change
      puts "State of project has been changed"
      puts "From: #{aasm.from_state} to #{aasm.to_state} "
    end


    def managers
      self.project_members.where(is_manager: true).all.to_a
    end

    private
    def has_unique_user
      error_count = 0
      pro_mem=self.project_members.collect(&:user_id)
      self.project_members.each do |project_member| 
        count = 0
        pro_mem.each do |p|
          count = count+1 if (project_member.user_id).eql?(p)
        end
        if count > 1
          error_count = error_count + 1
          project_member.errors[:user_id] << "is duplicated on same form"
        end
      end
      false if (error_count > 0)
    end

  end

end
