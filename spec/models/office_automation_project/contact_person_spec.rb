require 'spec_helper'

module OfficeAutomationProject
  describe ContactPerson do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :primary_email_id, :secondary_email_id, :phone_no, :address, :skype_id, :linkedin_id, :twitter_id)}
    end

    context 'It checks for validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:primary_email_id) }
      it { should validate_presence_of(:phone_no) }
      it { should validate_uniqueness_of(:primary_email_id) }
      it { should validate_uniqueness_of(:secondary_email_id) }
      it { should validate_uniqueness_of(:phone_no) }
      it { should validate_uniqueness_of(:skype_id) }
      it { should validate_uniqueness_of(:linkedin_id) }
      it { should validate_uniqueness_of(:twitter_id) }
    end

    context 'It checks for associations' do
      it { should be_embedded_in (:project) }
    end

  end
end
