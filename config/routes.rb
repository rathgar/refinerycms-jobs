Refinery::Core::Engine.routes.draw do
  namespace :jobs, :path => Refinery::Jobs.page_url do
    root :to => "jobs#index"
    resources :jobs, :path => '', :only => [:index, :show] do
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