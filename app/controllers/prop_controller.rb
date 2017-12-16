class PropController < ApplicationController

  get '/props/index' do
    erb :"props/index"
  end

  get '/scrape' do
    Scraper.scrape_props
    @props = Prop.all_props
    erb :"/props/index"

  end





end
