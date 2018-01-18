Rails.application.routes.draw do
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/register' => 'sessions#index'
post '/lender' => 'lender#create'
post '/borrower' => 'borrower#create'
get '/lender/:id' => 'lender#show'
get '/borrower/:id' => 'borrower#show'
get '/logout' => 'sessions#destroy'

end
