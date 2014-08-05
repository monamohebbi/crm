class IssuesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @issues = Issue
    @issues = IssueFilterer.new(params).filter
  end
  
  def new
    @issue = Issue.new
#     raise @issue.inspect
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
    @action = Action.new
    @actions = @issue.actions
  end

end
