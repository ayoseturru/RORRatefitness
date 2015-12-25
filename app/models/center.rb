class Center < ActiveRecord::Base
  scope :filter, -> (filter = nil) { where("centers.name LIKE ?", "%#{filter}%") }

  def get_images
    if images
      return images.split("&")
    else
      return []
    end
  end
end
