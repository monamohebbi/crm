class ActionsController < ApplicationController
  def create
    issue = Issue.find(params["issue_id"])
    issue.actions.create(params["new_action"].permit(:name, :date, :text))
    redirect_to issue_path(issue.id)
  end
end
