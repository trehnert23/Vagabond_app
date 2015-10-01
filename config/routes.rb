Rails.application.routes.draw do

root to: "users#index"

  ### ARTICLES ###

    get "/articles/new", to: "articles#new", as: "new_article"

    post "/articles", to: "articles#create"
    
    get "/articles/:id", to: "articles#show", as: "article"

    get "/login", to: "sessions#new", as: "login"

    get "/articles/:id/edit", to: "articles#edit", as: "edit_article"

    patch "/articles/:id", to: "articles#update"

    delete "/articles/:id", to: "articles#destroy", as: "delete_article"


  ### COMMENTS ###

    post '/articles/:article_id/comments', to: 'comments#create_comment', as: 'article_comments'

  ### USERS ###

    get "/users", to: "users#index", as: "users"

    get "/users/new", to: "users#new", as: "new_user"

    post "/users", to: "users#create"

    get "/users/:id", to: "users#show", as: "user"

    get "/users/:id/edit", to: "users#edit", as: "edit_user"

    patch "/users/:id", to: "users#update"

  ### SESSIONS ###

    post "/sessions", to: "sessions#create"

    delete '/sessions', to: 'sessions#destroy'


    ### CITIES

    get "/cities/:id", to: "cities#show", as: "city"




    

end