class ActionsController < ApplicationController
  before_action :authenticate_user!

  def create
    issue = Issue.find(params["issue_id"])
    new_action = issue.actions.create(action_params)
    redirect_to issue_path(issue.id)
  end

  def edit
    @issue = Issue.find(params["issue_id"])
    @actions = @issue.actions
    @action = @actions.find(params["id"]
  end

  def update
    @actions = Issue.find(params["issue_id"]).actions
    @action = @actions.find(params["id"])
    @action.update_attributes(action_params)
    redirect_to issue_path(params["issue_id"])
  end

  private

  def action_params
    params["new_action"].permit(:action_title, :name, :date, :text)
  end
end
