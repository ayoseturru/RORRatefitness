class Review < ActiveRecord::Base
  belongs_to :center
  belongs_to :user
  before_save :set_date
  validates :user_id, uniqueness: {message: "No puede valorar dos veces un centro"}
  validates :title, presence: {message: "Es necesario un titulo"}

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

  private
  def set_date
    self.date = Time.now.strftime("%d/%m/%Y")
  end
end
