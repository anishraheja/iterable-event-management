class HomeController < ApplicationController
  def index
    @events = Event.where('name ILIKE ?', "%#{params[:search]}%") if params[:search]
  end

  def search
  end
end
