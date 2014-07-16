class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end
  def new
    @issue= Issue.new
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
     @issue.update_attributes(params["issue"].permit(:customer_name, :issue_title, :received_by, :assigned_to, :assigned_date))
    redirect_to issues_path
  end
  def show
    @issue = Issue.find(params["id"])
    @action = @issue.actions.build
  end

end
