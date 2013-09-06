class ApplicationsController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.all
  end

  def show
    @application = Application.find(params[:id])
  end
end
