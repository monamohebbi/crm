class ActionsController < ApplicationController
  def create
#     raise params.inspect
#     issue = Issue.find(params["id"])
#     issue.actions.create(params["action"].permit(:name, :date, :text))
#     redirect_to issue_path(issue.id)
  end
  
  def new
    raise 'BOOM!'
  end
end
