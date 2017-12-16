class UserController < ApplicationController

  get '/users/home' do
    @user = User.find_by(id: session[:user_id])
    if logged_in?(session)
      erb :"users/home"
    else
      erb :index
    end
  end


end
