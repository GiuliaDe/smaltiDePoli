Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'artworks#index'


  # Example resource route (maps HTTP verbs to controller actions automatically):
   resources :artworks
   resources :artists
   resources :collaborations

end
