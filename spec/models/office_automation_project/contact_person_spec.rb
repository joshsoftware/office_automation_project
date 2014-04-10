require 'spec_helper'

module OfficeAutomationProject
  describe ContactPerson do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :primary_email_id, :secondary_email_id)}
      it { should have_field(:phone_no).of_type(Integer) }
    end

    context 'It checks for validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:primary_email_id) }
      it { should validate_presence_of(:phone_no) }
    end

    context 'It checks for associations' do
      it { should embed_one (:contact_person_address) }
      it { should be_embedded_in (:client) }
    end

  end
end
