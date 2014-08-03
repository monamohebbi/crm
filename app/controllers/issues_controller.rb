class IssuesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @issues = Issue
    @employees = ["Mona", "Edward", "Matthew", "Other"]
    @titles = ["defect/bug", "Missing functionality", "New change request", "other"]
    
    if params[:aasm_state].present?
      @issues = @issues.where(:aasm_state => params[:aasm_state])
    end
        
    if params[:received_by].present?
      @issues = @issues.where(:received_by => params[:received_by])
    end
    
    if params[:assigned_to].present?
      @issues = @issues.where(:assigned_to => params[:assigned_to])
    end
    
    if params[:opened_after].present?
      @issues = @issues.where("assigned_date >= :opened_after", :opened_after => DateTime.parse(params[:opened_after]))
    end
    
    if params[:opened_before].present?
      @issues = @issues.where("assigned_date <= :opened_before", :opened_before => DateTime.parse(params[:opened_before]))
    end
    
    if params[:issue_title].present?
      if params[:issue_title] != "other"
        @issues = @issues.where(:issue_title => params[:issue_title])  
      else
        #find a way to sort out everything else
      end
    end
     
    @issues = @issues.all
  end
  
  def new
    @issue = Issue.new
#     raise @issue.inspect
    @employees = ["Mona", "Edward", "Matthew", "Other"]
    @titles = ["defect/bug", "Missing functionality", "New change request", "other"]
  end
  
  def create
    Issue.create(params["issue"].permit(:customer_name, :issue_title, :received_by, :assigned_to, :assigned_date))
    redirect_to issues_path
  end
  
  def edit
    @issue=Issue.find(params["id"])
    @titles = ["defect/bug", "Missing functionality", "New change request", "other"]
    @employees = ["Mona", "Edward", "Matthew", "Other"]
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
    @employees = ["Mona", "Edward", "Matthew", "Other"]
    @action_titles = ["Investigate", "Created Bug",  "Fixed server", "Helped Customer", "Closed Issue", "Others" ]
  end

end
