Rails.application.routes.draw do
  get "lendings/create"
  get "lendings/update"
  get "books/index"
  get "books/show"
  get "books/new"
  get "books/create"
  get "books/edit"
  get "books/update"
  get "books/destroy"
  Rails.application.routes.draw do
    resources :books do
      resources :lendings, only: [:create, :update]
    end
  
    get "borrowers/:borrower_name", to: "lendings#borrower_history", as: "borrower_history"
    root "books#index"
 
  
  get "up" => "rails/health#show", as: :rails_health_check

  
end
