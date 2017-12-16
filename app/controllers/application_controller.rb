require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
  end


  get '/' do
    if logged_in?
      erb :"props/index"
    else
      erb :index
    end

  end

  get '/login' do
    erb :login

  end

  get '/signup' do
    erb :signup
  end

helpers do

  def current_user

  end


  def logged_in?
    true

  end


end


end
