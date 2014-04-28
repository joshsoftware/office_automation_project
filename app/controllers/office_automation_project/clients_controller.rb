require_dependency "office_automation_project/application_controller"

module OfficeAutomationProject
  class ClientsController < ApplicationController
    load_and_authorize_resource

    before_action :load_client, only: [:edit, :show, :update]
    def new
      @client = Client.new
    end

    def create
      @client = Client.new(client_params)
      @client.company = current_user.company
      if @client.save
        flash[:success] = "Congratulations!! You have successfully added client"
        redirect_to office_automation_project.new_company_client_path
      else
        flash[:danger] = "Please fill the mandatory fields"
        render :new
      end
    end

    def index
      @clients = current_user.company.clients
    end

    def edit
    end

    def update
      if @client.update_attributes client_params
        flash[:success] = "Congratulations!! You have successfully updated client"
        redirect_to office_automation_project.edit_company_client_path
      else
        flash[:danger] = "Please fill details accordingly"
        render :edit
      end

    end

    def show
    end

    def load_client
      @client = Client.find[params[:id])
    end

    private

    def client_params
      params[:client].permit(:name, :currency, :primary_email_id, :secondary_email_id, :phone_no, :address, :city, :state, :country, :pincode)
    end

  end
end
