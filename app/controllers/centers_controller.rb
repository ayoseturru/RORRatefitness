class CentersController < ApplicationController
  before_action :set_center, only: [:show]
  before_action :authenticate, only: [:destroy, :create]
  before_action :admin_authenticate, only: [:update, :edit, :images, :delete_images]

  def index
    @centers = Center.filter(params[:filter])
    if @centers.present?
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js { render "fail_search.js.erb" }
      end
    end
  end

  def show
    redirect_to({action: :index}, notice: 'Centro no encontrado') unless @center
  end

  def set_center
    @center = Center.find_by_id(params[:id])
  end

  def opinions
    @center = Center.find_by_id(params[:id])
  end

  def new
    @center = Center.new
  end

  def edit
    if !Center.exists?(id: params[:id])
      redirect_to root_url, alert: "El centro no existe"
      return false
    end
    @center = Center.find(params[:id])
  end

  def update
    @center = Center.find(params[:id])
    if @center.update(center_params)
      redirect_to :back, notice: "Su centro deportivo se ha actualizado correctamente"
    end
  end

  def center_params
    params.require(:center).permit(:email, :phone, :second_phone, :description, :monday_friday, :saturday, :sunday)
  end

  def images
    if params[:images]
      center = Center.find(params[:center_id])
      params[:images].each do |image|
        CenterImage.create(photo: image, center: center)
      end
      redirect_to :back, notice: "Sus imágenes se añadieron correctamente"
    else
      redirect_to :back, alert: "No se seleccionó ninguna imagen o no pudo ser añadida"
    end
  end

  def delete_images
    @center = Center.find(params[:center_id])
    image = CenterImage.find(params[:image_id])
    if @center.present? and image.present?
      delete_image(image)
      @image_id = params[:image_id]
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "fail_delete_image.js.erb" }
      end
    end
  end

  protected
  def delete_image(image)
    image.photo.destroy
    image.photo.clear
    image.delete
  end

  def admin_authenticate
    return false unless authenticate and (current_user.role.include? "admin" and owned_center_to_user?)
  end

  def owned_center_to_user?
    if !Center.exists?(id: params[:id])
      return false
    end
    redirect_to root_url, alert: "No tienes permisos" unless Center.find(params[:id]).user == current_user
  end
end

# def index
#   @articles = Article.con_titulo(params[:buscar])
#   if @articles.present?
#     respond_to do |format|
#       format.html
#       format.js
#     end
#   else
#     respond_to do |format|
#       format.html
#       format.js { render "fallo_articulos.js.erb" }
#     end
#   end
# end