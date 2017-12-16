class PropController < ApplicationController

  get '/props/index' do
    Scraper.scrape_props
    @props = Prop.all_props
    erb :"/props/index"
  end

  get '/scrape' do

  end





end
