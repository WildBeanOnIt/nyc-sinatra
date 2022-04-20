class FiguresController < ApplicationController
  # add controller methods

  # index
  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  # new 
  get "/figures/new" do 
    erb :"figures/new"
  end








end
