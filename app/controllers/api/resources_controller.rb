class Api::ResourcesController < ApplicationController

  def index
    @resources = Resource.all
    render 'index.json.jb'
  end

  def show
    @resource = Resource.find(params[:id])
    render 'show.json.jb'
  end

end 
