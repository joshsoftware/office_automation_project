require 'spec_helper'

module OfficeAutomationProject
  describe Project do

    context 'It checks presence of fields' do
      it { should have_fields(:project_name, :description, :codeclimate, :status) }
      it { should have_fields(:start_date, :end_date).of_type(Date) }
    end

    context 'It validates fields' do
      it { should validate_presence_of(:project_name) }
      it { should validate_presence_of(:start_date) }
      it { should validate_presence_of(:status) }
    end
    
    context 'It checks for associations' do
      it { should embed_many (:attachments) }
      it { should belong_to (:company) }
      it { should have_many (:projectmembers) }
      it { should have_one (:client) }
    end

  end
end
