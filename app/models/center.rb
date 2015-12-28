class Center < ActiveRecord::Base
  validates_presence_of :tennis, :aerobic, :aquagym, :zumba, :fitness, :municipality
  before_save :municipalty_to_lower_case
  has_many :reviews, :dependent => :delete_all
  scope :filter, -> (filter = nil) { where("centers.name LIKE ?", "%#{filter}%") }
  scope :news, -> { order("created_at DESC").limit(5) }
  scope :betters, -> { order("rate DESC").limit(5) }
  scope :search_filter, -> (municipality, price = nil, stars = nil, aerobic = nil, fitness = nil, aquagym= nil, tennis= nil, zumba = nil) {
    where("centers.municipality = ? AND centers.price LIKE ? AND centers.rate >= ? AND centers.aerobic LIKE ? AND centers.fitness LIKE ? AND centers.aquagym LIKE ? AND centers.tennis LIKE ? AND centers.zumba LIKE ?",
          "#{municipality.downcase}", "%#{price}%", stars.to_f, "%#{aerobic}%", "%#{fitness}%", "%#{aquagym}%", "%#{tennis}%", "%#{zumba}%") }

  def get_images
    if images
      return images.split("&")
    else
      return []
    end
  end

  def municipalty_to_lower_case
    self.municipality = self.municipality.downcase
  end

  def get_media
    return (self.reviews.sum(:rate) / self.reviews.count)
  end
end
