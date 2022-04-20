class LandmarksController < ApplicationController
  # add controller methods

  # index 
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  # new 
  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  get "/landmarks/:id" do
    @landmarks = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get "/landmarks/:id/edit" do 
    @landmark = Landmark.find(params[:id])  
    erb :"/landmarks/edit"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    redirect to "/landmarks/#{@landmark.id}"
  end

  post "/landmarks" do
    Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    redirect to "/landmarks"
  end

end
