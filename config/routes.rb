OfficeAutomationProject::Engine.routes.draw do
  mount OfficeAutomationEmployee::Engine => '/employee'
  resources :companies do
    resources :clients
    resources :projects do
       resources :contact_persons, only: ['destroy', 'show']
    end
  end
end
