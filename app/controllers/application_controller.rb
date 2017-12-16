require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?(session)
      erb :"/users/home"
    else
      erb :index
    end
  end

  get '/login' do
    if logged_in?(session)
      redirect to '/users/home'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.username == params[:username] && @user.authenticate(params[:password])
      session[:user_id] = @user[:id]
      redirect to "/users/home"
    else
      erb :error
    end
  end

  get '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    erb :signup
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.errors.any?
      erb :signup
    else
      session[:id] = @user.id
      redirect to "/users/home"
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


  def current_user(session)
    @current_user = User.find(session[:user_id])
  end

  def logged_in?(session)
    !!session[:user_id]
  end

end
