require 'spec_helper'

module OfficeAutomationProject
  describe Client do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :currency, :primary_email_id, :secondary_email_id) }
      it { should have_fields(:phone_no).of_type(Integer) }
    end

    context 'It validates fields' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:primary_email_id) }
      it { should validate_numericality_of(:phone_no) }
    end
    
    context 'It checks for associations' do
      it { should embed_one (:client_address) }
      it { should embed_many (:contactpersons) }
      it { should belong_to (:project) }
    end

  end
end
