require 'spec_helper'

module OfficeAutomationProject
  describe Project do

    context 'It checks presence of fields' do
      it { should have_fields(:name, :description, :codeclimate_url) }
      it { should have_fields(:start_date, :end_date).of_type(Date) }
    end

    context 'It validates fields' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:start_date) }
      it { should validate_uniqueness_of(:name) }
    end
    
    context 'It checks for associations' do
      it { should embed_many (:attachments) }
      it { should belong_to (:company) }
      it { should have_many (:project_members) }
      it { should belong_to (:client) }
      it { should embed_many (:contact_persons)}
    end

  end
end
