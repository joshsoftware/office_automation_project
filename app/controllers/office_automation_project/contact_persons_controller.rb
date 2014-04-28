require_dependency "office_automation_project/application_controller"

module OfficeAutomationProject
  class ContactPersonsController < ApplicationController
    def destroy
      @project = Project.find(params[:project_id])
      @contact_person = @project.contact_persons.find(params[:id])
      if @contact_person.destroy
        flash[:success] = 'Contact person deleted successfully!!'
      else
        flash[:danger] = 'Unable Delete contact person!!'
      end
      respond_to do |format|
        format.js
      end
    end

    def show
      @project = Project.find(params[:project_id])
      @contact_person = @project.contact_persons.find(params[:id])
      respond_to do |format|
        format.js
      end
    end
  end
end
