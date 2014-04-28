require 'spec_helper'

module OfficeAutomationProject
  describe ProjectsController do
    routes { OfficeAutomationProject::Engine.routes }
    let(:company) { create(:company) }
    let(:admin) { create(:admin, company_id: company.id) }
    let(:project) { create(:project, company_id: company.id) }
    let(:client) { create(:client, company_id: company.id) }
    let(:project_member) { create(:project_member, project_id: project, user_id: user.id) }

    before(:each) do
      admin.confirm!
      sign_in admin
    end

    after(:each) do
      sign_out admin
    end

    context "#index" do
      it 'renders index template if logged in user is admin' do
        get :index, company_id: admin.company
        expect(response).to render_template(:index)
      end
    end

    context '#edit' do
      it 'renders edit template' do
        get :edit, company_id: admin.company, id: project.id
        expect(response).to render_template(:edit)
      end
    end

    context '#show' do
      it 'renders show template if logged in user is admin' do
        get :show, company_id: admin.company, id: project.id
        expect(response).to render_template(:show)
      end
    end

    context '#create' do
      it 'Creates new project' do
        pro_count = Project.count
        pro_member_count = ProjectMember.count

        post :create, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014", client_id: client.id, project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 1234567890", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company

        expect(Project.count).to eq(pro_count+1)
        expect(ProjectMember.count).to eq(pro_member_count+1)
        expect(flash[:success]).to eq('Congratulations!! You have successfully created a project')
      end

      it 'will not Create new project if mandatory fields are missing' do
        pro_count = Project.count
        pro_member_count = ProjectMember.count

        post :create, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014", project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 1234567890", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company

        expect(Project.count).to eq(pro_count)
        expect(ProjectMember.count).to eq(pro_member_count)
        expect(flash[:danger]).to eq('Please fill the mandatory fields')
      end

      it 'will not Create new project if end date is less than start date' do
        pro_count = Project.count
        pro_member_count = ProjectMember.count

        post :create, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014" , end_date: "08-04-2013", client_id: client.id, project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 1234567800", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company

        expect(Project.count).to eq(pro_count)
        expect(ProjectMember.count).to eq(pro_member_count)
        expect(flash[:danger]).to eq('Please fill the mandatory fields')
      end


      it 'will not Create new project if user id is repeated in project member for project' do
        pro_count = Project.count
        pro_member_count = ProjectMember.count

        post :create, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014", project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}, "0"=> {user_id: admin.id, is_manager: "false", _destroy: false}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 1234567880", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company

        expect(Project.count).to eq(pro_count)
        expect(ProjectMember.count).to eq(pro_member_count)
        expect(flash[:danger]).to eq('Please fill the mandatory fields')
      end
    end
    context '#update' do

      it 'Updates project if current user is admin' do
        put :update, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014", client_id: client.id, project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 1234567890", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company, id: project.id

        expect(project.reload.name).to eq("project_new")
        expect(flash[:success]).to eq('Congratulations!! You have successfully updated a project')
      end

      it 'will not update project if user_id is aldready taken' do
        project_name = project.name
        put :update, project: {name: "project_new", "status"=>"pending", start_date: "08-04-2014", client_id: client.id, project_members_attributes: {"0"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}, "1"=> {user_id: admin.id, is_manager: "true", _destroy: "false"}}, contact_persons_attributes: {"0"=> {name: "person", primary_email_id: "person@domain.com", secondary_email_id: "person1@domain.com", phone_no: "+91 9234567890", address: "pune", skype_id: "skype", linkedin_id: "link", twitter_id: "twit", _destroy: "false"}}}, company_id: admin.company, id: project.id

        expect(project.reload.name).to eq(project_name)
        expect(flash[:danger]).to eq('Please fill the fields accordingly..')
      end

    end
  end
end
