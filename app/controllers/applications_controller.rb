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
    gon.application_id = @application.id
    gon.categories = @categories
    if request.get?
      # voting interface
    else
      Voting
        .find_or_create_by(application_id: @application.id, user_id: current_user.id, category_id: params[:category_id])
        .update_attributes!(score: params[:score])
      head :ok
      # create vote
    end
  end
end
