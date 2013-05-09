Refinery::Core::Engine.routes.draw do

  resources :jobs, :only => [:show, :index] do
    resources :job_applications
  end

  namespace :admin, :path => 'refinery' do
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


