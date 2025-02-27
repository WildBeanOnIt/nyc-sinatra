class FiguresController < ApplicationController
  # add controller methods

  # index
  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  # new/create
  get "/figures/new" do 
    erb :"figures/new"
  end
  # POST
  post "/figures" do
    @figure = Figure.create(params["figure"])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    refirect to "/figure/#{@figure.id}"
  end

  # show
  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  # edit 
  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  # update
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
