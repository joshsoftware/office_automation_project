require 'spec_helper'

module OfficeAutomationProject
  describe Client do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :currency, :primary_email_id, :secondary_email_id, :phone_no, :address, :city, :state, :country, :pincode) }
    end

    context 'It validates fields' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:primary_email_id) }
      it { should validate_presence_of(:secondary_email_id) }
      it { should validate_presence_of(:phone_no) }
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:country) }
      it { should validate_presence_of(:pincode) }
      it { should validate_presence_of(:currency) }
      it { should validate_uniqueness_of(:name).scoped_to(:company) }
      it { should validate_uniqueness_of(:primary_email_id).scoped_to(:company) }
      it { should validate_uniqueness_of(:secondary_email_id).scoped_to(:company) }
      it { should validate_uniqueness_of(:phone_no).scoped_to(:company) }
      it { should validate_numericality_of(:pincode) }
    end

    context 'It checks for associations' do
      it { should have_many (:projects) }
      it { should belong_to (:company) }
    end

  end
end
