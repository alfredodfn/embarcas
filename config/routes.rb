# frozen_string_literal: true

Rails.application.routes.draw do
  root 'cities#index'
  resources :cities do
    collection do
      get :autocomplete
    end
  end 
end
