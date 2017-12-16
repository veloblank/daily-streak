require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end



  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user != nil && @user["password"] == params[:password]
      session[:user_id] = @user[:id]
      redirect to "props/index"
    else
      erb :error
    end
  end

  get '/signup' do
    erb :signup
  end


end
