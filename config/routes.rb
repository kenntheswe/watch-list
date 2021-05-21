# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[ index show new create ] do
    resources :bookmarks, only: %i[ new create ]
  end
  resources :bookmarks, only: %i[ destroy ]
  root to: 'lists#index'
end
