class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id.to_i)
      end
    end

    if params["title"]["name"] != nil
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    if params["figure"]["title_ids"] != nil
    params["figure"]["title_ids"].each do |title_id|
      title = Title.find(title_id.to_i)
      @figure.titles << title
    end
  end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
