Refinery::Application.routes.draw do
  resources :jobs, :only => [:show, :index] do
    resources :job_applications
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :jobs, :except => :show do
      collection do
        post :update_positions
      end
	  member do
		get :job_applications
      end
	end 
  end
end


