require_dependency "office_automation_project/application_controller"

module OfficeAutomationProject
  class ProjectsController < ApplicationController

    load_and_authorize_resource 

    def index
      @projects = (current_user.role? OfficeAutomationEmployee::Role::ADMIN) ? current_user.company.projects.all : current_user.project_list
    end

    def show
      @project = Project.find(params[:id])
    end

    def edit
      @project = OfficeAutomationProject::Project.find(params[:id])
      @users = current_user.company.users.where(status: 'Active')
      @clients = current_user.company.clients
      @project.contact_persons.build
      @project.project_members.build
    end

    def update
      if @project.update_attributes project_params
        flash[:success] = "Congratulations!! You have successfully updated a project"
        redirect_to office_automation_project.edit_company_project_path(@current_user.company, @project)
      else
        @users = current_user.company.users.where(status: 'Active')
        flash[:danger] = "Please fill the fields accordingly.."
        render :edit
      end
    end

    def new
      @project = Project.new
      @project.contact_persons.build
      @company =  OfficeAutomationProject::Project.find(params[:company_id])
      @project_members = @project.project_members.build
      @users = current_user.company.users.where(status: 'Active')
    end

    def create
      @project = Project.new(project_params)
      @project.company = current_user.company

      if @project.valid? and @project.save
        flash[:success] = "Congratulations!! You have successfully created a project"
        redirect_to office_automation_project.new_company_project_path 
      else
        @users = current_user.company.users.where(status: 'Active')
        flash[:danger] = "Please fill the mandatory fields"
        render :new
      end
    end

    private

    def project_params
      params[:project][:contact_persons_attributes].keep_if{|k,v| v[:_destroy] == 'false' if v.has_key?(:_destroy) } if params[:project].include?(:contact_persons_attributes)

      params[:project][:project_members_attributes].keep_if{|k,v| v[:_destroy] == 'false' if v.has_key?(:_destroy) } if params[:project].include?(:project_members_attributes)

      params.require(:project).permit(:name, :status, :description, :start_date, :end_date, :codeclimate_url, :client_id, project_members_attributes: [:is_manager, :id, :user_id], contact_persons_attributes: [:name, :primary_email_id, :secondary_email_id, :phone_no, :address, :skype_id, :linkedin_id, :twitter_id, :id])
    end
  end

end
