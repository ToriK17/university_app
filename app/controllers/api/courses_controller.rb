class Api::CoursesController < ApplicationController

  def index
    @courses = Course.all
    render 'index.json.jb'   
  end

  def show
    @course = Course.find(params[:id])
    render 'show.json.jb'
  end

end
