Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :event_venues, :tickets

  resources :ticket_types do
    resources :tickets
  end

  resources :users do
    member do
      get 'user_with_most_tickets'
    end
  end

  resources :events do
    member do
      get 'upcoming_events'
    end
  end

  #get 'ticket_types/create'
  #get 'ticket_types/update'
  #get 'ticket_types/destroy'
  #get 'tickets/create'
  #get 'tickets/update'
  #get 'tickets/destroy'
  #get 'event_venues/create'
  #get 'event_venues/update'
  #get 'event_venues/destroy'
  #get 'events/create'
  #get 'events/update'
  #get 'events/destroy'
  #get 'users/create'
  #get 'users/update'
  #get 'users/destroy'
end
