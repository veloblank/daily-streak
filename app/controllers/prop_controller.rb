class PropController < ApplicationController

  get '/props' do
    Scraper.scrape_props
    @props = Prop.all_props
    erb :"/props"
  end

  get '/props/:id' do
  end

  get '/scrape' do

  end





end
