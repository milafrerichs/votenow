class ApplicationsController < ApplicationController

  def index

  end

  def show
    @application = Application.find(params[:id])
  end
end
