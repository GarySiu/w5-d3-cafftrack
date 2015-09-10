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
    data = {date: params[:date], quantity: params[:quantity], drink_type: params[:drink_type], location: params[:location]}
    @drink = Drink.new data
    @drink.save
    redirect to '/drinks'
  end

  get '/drinks/:id' do # show
    @drink = Drink.find params[:id]
  end

  get '/drinks/:id/edit' do # edit
    @drink = Drink.find params[:id]
  end

  put '/drinks/:id' do # update
    data = {date: params[:date], quantity: params[:quantity], drink_type: params[:drink_type], location: params[:location]}
    @drink = Drink.find(params[:id])
    @drink.update data
  end

  delete '/drinks/:id' do # delete
    @drink = Drink.find params[:id]
    @drink.destroy
  end

end