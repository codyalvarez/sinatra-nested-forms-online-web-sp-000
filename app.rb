require "pry"
require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
     "Welcome to the Nested Forms Lab!"
    end

    get '/new' do

      erb :"pirates/new/view"
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
        @ships = Ship.all
      # binding.pry
        erb :"pirates/show"
    end

  end
end
