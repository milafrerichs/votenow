class ApplicationsController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @application = Application.find(params[:id])
  end
end
