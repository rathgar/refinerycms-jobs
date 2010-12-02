Refinery::Application.routes.draw do
  resources :jobs, :only => [:show, :index] do
    resources :job_applications
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :jobs do
      member do
        get :job_applications
      end
    end 
  end
end

