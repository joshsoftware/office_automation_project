require 'spec_helper'

module OfficeAutomationProject
  describe ProjectMember do
    context 'It checks presence of fields' do
      it { should have_field(:is_manager).of_type(Mongoid::Boolean) }
    end

    context 'It validates fields' do
      it { should validate_uniqueness_of(:user_id).scoped_to(:project) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:project_id) }
    end

    context 'It checks for associations' do
      it { should belong_to (:user) }
      it { should belong_to (:project)}
    end

  end
end
