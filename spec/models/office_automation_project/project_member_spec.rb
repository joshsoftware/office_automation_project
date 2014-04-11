require 'spec_helper'

module OfficeAutomationProject
  describe ProjectMember do
    context 'It checks presence of fields' do
      it { should have_field(:is_manager).of_type(Mongoid::Boolean) }
    end

    context 'It checks for associations' do
      it { should belong_to (:user) }
      it { should belong_to (:project)}
    end

  end
end
