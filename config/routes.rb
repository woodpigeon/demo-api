DemoApi::Application.routes.draw do

  namespace :v1 do
    resources :teams, 
              except: [:create], 
              :defaults => { :format => 'json' }
  end
  
end
