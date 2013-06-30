RankOfGithub::Application.routes.draw do

  root 'home#index'
  get '/:page', to: "home#index"
  
end
