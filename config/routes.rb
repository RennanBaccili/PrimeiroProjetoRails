Rails.application.routes.draw do
  #to fazendo requisição get
  #que vai me redirecionar home
  # pagina principal index
  # quando alguem fizer o get, busca no controller e guia pro action
  
  #get '/', controller:'home',action:'index' padrão

  #rails routes -g home ->   #pegue todas as rotas, mas separe todas que tiver home dentro
  root 'home#index'

  resources :vehicles, only:[:index, :new, :create, :show, :edit, :update ,:destroy] #Resource

  # cria rotas definidas no only resources :vehicles, only:[:index, :new, :create ,:show ,:edit ,:update ,:destroy]

  # get '/vehicles', controller:'vehicles',action:'index'
  # get '/vehicles/:id', controller:'vehicles',action:'show' # mostrar um em especifico
  
  # get '/vehicles/new', controller:'vehicles',action:'new' #form
  # post '/vehicles', controller:'vehicles',action:'create'# created
  
  # get '/vehicles/:id/edit', controller:'vehicles',action:'edit'
  # put '/vehicles/:id', controller:'vehicles',action:'update'
  # patch '/vehicles/:id', controller:'vehicles',action:'update'
  # delete '/vehicles/:id', controller:'vehicles',action:'destroy'
end
