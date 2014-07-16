Crm::Application.routes.draw do
  get("/", {:controller => "issues", :action => "index"})
  resources :issues do
    resources :actions
  end

  
end
