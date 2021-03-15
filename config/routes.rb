Refinery::Core::Engine.routes.draw do
  namespace :jobs, path: Refinery::Jobs.page_url do
    root to: "jobs#index"

    resources :job_applications, only: [:new, :create]

    resources :jobs, path: '', only: [:index, :show] do
      resources :job_applications, only: [:new, :create]
    end

    resources :jobs, path: '', only: [], as: :job_applications, controller: 'job_applications' do
      get :thank_you, path: Refinery::Jobs.page_path_thank_you, on: :collection
    end
  end

  namespace :jobs, path: '' do
    namespace :admin, path: Refinery::Core.backend_route do
      resources :jobs, except: :show do
        collection do
          post :update_positions
        end
        resources :job_applications
      end
    end
  end

end
