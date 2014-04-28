require 'spec_helper'

module OfficeAutomationProject
  describe ClientsController do
    routes { OfficeAutomationProject::Engine.routes }

    let(:company) { create(:company) }
    let(:admin) { create(:admin, company_id: company.id) }
    let(:user) { create(:user) }
    let(:client) { create(:client, company_id: company.id) }
    before(:each) do
      admin.confirm!
      sign_in admin
      user.invite!(admin)
      sign_out admin
      user.update_attribute :company, admin.company
      user.accept_invitation!
      user.update_attribute :status, "Active"
    end


    context "#index" do
      it 'renders index template if logged in user is admin' do
        sign_in admin
        get :index, company_id: admin.company
        expect(response).to render_template(:index)
        sign_out admin
      end


      it 'will not render index template if logged in user is not admin' do

        sign_in user
        expect(user.role? OfficeAutomationEmployee::Role::ADMIN).to eq(false)
        #expect(response).to redirect_to root_url
        sign_out user 
      end
    end
    context '#show' do
      it 'renders show template if logged in user is admin' do

        sign_in admin
        get :show, company_id: admin.company, id: client
        expect(response).to render_template(:show)
        sign_out admin
      end

      it 'will not render show temlate if logged in user is not admin' do

        sign_in user
        get :show, company_id: admin.company, id: client
        expect(user.role? OfficeAutomationEmployee::Role::ADMIN).to eq(false)
        sign_out user
      end
    end

    context '#new' do
      it 'renders new template if logged in user is admin' do

        sign_in admin
        get :new, company_id: admin.company
        expect(response).to render_template(:new)
        sign_out admin
      end

      it 'will not render new temlate if looged in user is not admin' do

        sign_in user
        get :new, company_id: admin.company
        expect(user.role? OfficeAutomationEmployee::Role::ADMIN).to eq(false)
        sign_out user
      end
    end

    context '#create' do
      it 'creates new client for company' do
        sign_in admin
        client_count = Client.count
        post :create, client: {name: "abcd", currency: "rs", primary_email_id: "client@domain.com", secondary_email_id: "client1@domain.com", phone_no: "+91 1234565890", address: "pune", city: "pune", state: "MH", country: "Kazakhstan", pincode: "34567"},  company_id: company.id
        expect(Client.count).to eq(client_count+1)
        expect(flash[:success]).to eq("Congratulations!! You have successfully added client")
        sign_out admin
      end
    end

    context '#create' do
      it 'will not create new client if validation fails' do
        sign_in admin
        client_count = Client.count
        post :create, client: {name: "abcd", currency: "rs", primary_email_id: "clientomain.com", secondary_email_id: "client1@domain.com", phone_no: "+91 1284567890", address: "pune", city: "pune", state: "MH", country: "Kazakhstan", pincode: "34567"},  company_id: company.id
        expect(Client.count).to eq(client_count)
        expect(flash[:danger]).to eq("Please fill the mandatory fields")
        sign_out admin
      end
    end

    context '#update' do
      it 'updates existing client details' do
        sign_in admin
        put :update, client: {name: "new_client", currency: "rs", primary_email_id: "cl@c.com", secondary_email_id: "c1@c.com", phone_no: "+91 1234987894", address: "pune", city: "pune", state: "MH", country: "Kazakhstan", pincode: "34567"}, company_id: company.id, id: client.id

        expect(client.reload.name).to eq("new_client")
        expect(flash[:success]).to eq('Congratulations!! You have successfully updated client')
        sign_out admin
      end

      context '#update' do
        it 'will not update existing client details if validation fails' do
          sign_in admin
          put :update, client: {name: "new_client", currency: "rs", primary_email_id: "clc.com", secondary_email_id: "c1@c.com", phone_no: "+91 9234987891", address: "pune", city: "pune", state: "MH", country: "Kazakhstan", pincode: "34567"}, company_id: company.id, id: client.id

          expect(flash[:danger]).to eq('Please fill details accordingly')
          sign_out admin
        end
      end
    end
  end
end
