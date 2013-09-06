class ApplicationsController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.all
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])

    gon.data = [
      {name: 'Category Name', score: 2.3},
      {name: 'lala', score: 4.3},
      {name: 'lalal2', score: 2.6},
      {name: 'lalala3', score: 1.3},
      {name: 'clalalal3', score: 2.3},
      {name: 'clalal3', score: 2.3}
    ]
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
