module ApplicationHelper
  def assigned_to_employees_for_select
    Employee.where(:software_technician => true).pluck(:name)
  end
  
  def employees_for_select
    Employee.pluck(:name)
  end
  
  def action_titles_for_select
    ["Investigate", "Created Bug",  "Fixed server", "Helped Customer", "Closed Issue", "Others" ]
  end
end
