class CentersController < ApplicationController
  before_action :set_center, only: [:show]

  def index
    @centers = Center.all
  end

  def show
    redirect_to({action: :index}, notice: 'Centro no encontrado') unless @center
  end

  def set_center
    @center = Center.find_by_id(params[:id])
  end
end
