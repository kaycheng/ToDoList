Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 
  resources :lists do 
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  root "lists#index"
end
