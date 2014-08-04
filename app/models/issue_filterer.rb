class IssueFilterer
  attr_accessor :params
  def initialize(params)
    @params = params
    @issues = Issue
  end
  
  def filter
    filter_by(:aasm_state)
    filter_by(:received_by)
    filter_by(:assigned_to)
    filter_by_opened_after
    filter_by_opened_before
    
    if params[:issue_title].present?
      if params[:issue_title] != "other"
        @issues = @issues.where(:issue_title => params[:issue_title])  
      else
        #find a way to sort out everything else
      end
    end
    
    @issues.all
  end
  
  private
  
  def filter_by(attribute_name)
    if params[attribute_name].present?
      @issues = @issues.where(attribute_name => params[attribute_name])
    end
  end
  
  def filter_by_opened_before
    if params[:opened_before].present?
      @issues = @issues.where("assigned_date <= :opened_before", :opened_before => DateTime.parse(params[:opened_before]))
    end
  end
  
  def filter_by_opened_after
    if params[:opened_after].present?
      @issues = @issues.where("assigned_date >= :opened_after", :opened_after => DateTime.parse(params[:opened_after]))
    end
  end
end