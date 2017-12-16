require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
  end


  get '/' do
    erb :index
  end

helpers do

  def current_user

  end


  def logged_in?

  end


end


end
