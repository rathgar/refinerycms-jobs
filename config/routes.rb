Refinery::Core::Engine.routes.draw do

  namespace :jobs, :path => '' do
    resources :jobs, :only => [:show, :index] do
      resources :job_applications
    end
  end

  namespace :jobs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
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

end