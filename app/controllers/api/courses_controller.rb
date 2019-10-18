class Api::CoursesController < ApplicationController

  def index
    @courses = Course.all
    render 'index.json.jb'   
  end

  def show
    @course = Course.find(params[:id])
    #here I need to link to all posts related to this one course once found
    render 'show.json.jb'
  end

end
