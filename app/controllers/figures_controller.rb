class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params[:name])
    slug = @figure.slug

    if !params["figure"]["landmark"].empty?
      @figure.landmark = Landmark.create(name: params["landmark"]["name"])
    end

    params["landmark"].each do |landmark_id|
      landmark = Landmark.find(landmark_id.to_i)
      @figure.landmarks << landmark
    end

    if !params["figure"]["title"].empty?
      @figure.title = Title.create(name: params["title"]["name"])
    end

    params["title"].each do |title_id|
      title = Title.find(title_id.to_i)
      @figure.titles << title
    end
    redirect to "/figures/#{slug}"
  end

end
