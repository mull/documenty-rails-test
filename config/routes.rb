Barebones::Application.routes.draw do

  namespace :api do
    namespace :business do
      namespace :v1 do
        resources :customers, :except => [:edit, :new, :update] do
          resources :purchases, :except => [:new, :edit]
        end
      end
    end
  end
end
