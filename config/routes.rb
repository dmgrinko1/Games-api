# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :games do
        get 'rps/play'
      end
    end
  end
end
