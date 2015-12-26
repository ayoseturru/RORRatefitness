class Advert < ActiveRecord::Base
  belongs_to :user
  before_save :set_date
  validates :title, presence: true
  validates :description, presence: true
  before_save :number_adverts, message: "No puede tener más de 3 anuncios"

  def number_adverts
    if self.user.adverts.count >= 3
      return false
    end
    return true
  end

  private
  def set_date
    self.date = Time.now.strftime("%d/%m/%Y")
  end
end
