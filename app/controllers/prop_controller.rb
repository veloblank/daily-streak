class PropController < ApplicationController

  get '/props/index' do
    Scraper.scrape_props
    binding.pry
  end


end
