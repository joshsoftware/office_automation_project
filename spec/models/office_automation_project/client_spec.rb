require 'spec_helper'

module OfficeAutomationProject
  describe Client do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :currency, :primary_email_id, :secondary_email_id, :phone_no, :address, :city, :state, :country, :pincode) }
    end

    context 'It validates fields' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:primary_email_id) }
      it { should validate_uniqueness_of(:primary_email_id) }
      it { should validate_uniqueness_of(:secondary_email_id) }
      it { should validate_uniqueness_of(:phone_no) }
      it { should validate_numericality_of(:pincode) }
    end
    
    context 'It checks for associations' do
      it { should have_many (:projects) }
    end

  end
end
