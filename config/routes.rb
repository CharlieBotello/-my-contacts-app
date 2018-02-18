Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  post 'contacts' => "contacts#create"
  get "/contacts/:id" => "contacts#show"
  patch "/contacts/:id" => 'contacts#update'
  delete 'contacts/:id' => 'contacts#destroy'
end
