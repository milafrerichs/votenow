class ApplicationsController < ApplicationController
  include ActionController::Live
  before_action :require_user

  def index
    @categories = Category.all
    @applications = Application.all
    scores = Application.all.sort_by(&:overall_score).reverse.map{|app| { name: app.name, score: app.overall_score } }
    gon.data = scores
  end

  def score_events
    response.headers['Content-Type'] = 'text/event-stream'
    if params[:id]
      @application = Application.find(params[:id])
      scores = Category.all.map{|cat| {name: cat.name, score: @application.score_for(cat)}}
    else
      scores = Application.all.sort_by(&:overall_score).reverse.map{|app| { name: app.name, score: app.overall_score } }
    end
    response.stream.write "data: #{scores.to_json}\n\n"
    response.stream.close
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
