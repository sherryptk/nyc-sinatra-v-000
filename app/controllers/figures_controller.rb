class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
  end

end
