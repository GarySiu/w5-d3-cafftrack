class Cafftrack < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do # homepage redirect to index
    redirect to '/drinks'
  end

  get '/drinks' do # index
    @drinks = Drink.all
    erb :index
  end

  post '/drinks' do # create
    hash = {sauce: 'cheese', name: '4 Cheeses'}
    @drink = Drink.new hash
    @drink.save
  end

  get '/drinks/:id' do # show
    @drink = Drink.find params[:id]
  end

  get '/drinks/:id/edit' do # edit
    @drink = Drink.find params[:id]
  end

  put '/drinks/:id' do # update
    hash = {sauce: 'chilli', name: 'Hot! Hot! Hot!'}
    @drink = Drink.find(params[:id])
    @drink.update hash
  end

  delete '/drinks/:id' do # delete
    @drink = Drink.find params[:id]
    @drink.destroy
  end

end