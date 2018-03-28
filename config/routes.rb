Rails.application.routes.draw do
  resources :matric_school_reports, only: [:index, :create, :show]
  root to: "matric_school_reports#index"
end
