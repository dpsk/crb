class HomeController < ApplicationController
  def index
    @adverts = Advert.all
  end
end