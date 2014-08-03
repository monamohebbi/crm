Crm::Application.routes.draw do
  devise_for :users#, :controllers => {:registrations => "registrations"}
  get("/", {:controller => "issues", :action => "index"})
  resources :issues do
    resources :actions
  end
  resources :employees
  
end
