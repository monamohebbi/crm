Crm::Application.routes.draw do
  devise_for :users
  get("/", {:controller => "issues", :action => "index"})
  resources :issues do
    resources :actions
  end

  
end
