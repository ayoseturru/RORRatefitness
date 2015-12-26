class Center < ActiveRecord::Base
  has_many :reviews, :dependent => :delete_all
  scope :filter, -> (filter = nil) { where("centers.name LIKE ?", "%#{filter}%") }
  scope :news, -> { order("created_at DESC").limit(5) }

  def get_images
    if images
      return images.split("&")
    else
      return []
    end
  end

  def get_media
    return (self.reviews.sum(:rate) / self.reviews.count)
  end
end
