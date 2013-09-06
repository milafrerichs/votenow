class ApplicationsController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.all
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    scores = Category.all.map{|cat| {name: cat.name, score: @application.score_for(cat)}}

    gon.data = scores
  end

  def vote
    @application = Application.find(params[:id])
    @categories = Category.all
    if request.get?
      # voting interface
    else
      # create vote
    end
  end
end
