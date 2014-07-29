class IssuesController < ApplicationController
  before_action :authenticate_user!
  def index
    @issues = Issue
    
    if params[:assigned_to].present?
      @issues = @issues.where(:assigned_to => params[:assigned_to])
    end
    
    if params[:opened_after].present?
      @issues = @issues.where("assigned_date >= :opened_after", :opened_after => DateTime.parse(params[:opened_after]))
    end
    
    if params[:aasm_state].present?
      @issues = @issues.where(:aasm_state => params[:aasm_state])
    end

    @issues = @issues.all
  end
  def new
    @issue = Issue.new
    @employees = Employee.all
  end
  def create
    Issue.create(params["issue"].permit(:customer_name, :issue_title, :received_by, :assigned_to, :assigned_date))
    redirect_to issues_path
  end
  def edit
    @issue=Issue.find(params["id"])
  end
  def update
     @issue=Issue.find(params["id"])
     @issue.update_attributes(params["issue"].permit(:customer_name, :issue_title, :received_by, :assigned_to, :assigned_date, :aasm_state))
    redirect_to issues_path
  end
  def show
    @issue = Issue.find(params["id"])
    @action = @issue.actions.build
    @actions = @issue.actions
  end

end
