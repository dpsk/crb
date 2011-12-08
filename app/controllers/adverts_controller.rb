# coding: utf-8
class AdvertsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  def create
    @advert = current_user.adverts.build(params[:advert])
    if @advert.save
      redirect_to root_path, notice: "Ваша объявление успешно создано"
    else
      render "new"
    end
  end

end