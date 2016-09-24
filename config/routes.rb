Rails.application.routes.draw do

  resource :repos, only: [:create]

end
