class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: {minimum: 4}
  validates :stars, :inclusion => 1..5, numericality: {only_integer: true}

  def stars_as_percent
    (stars / 5.0) * 100.0
  end

  STARS = [1,2,3,4,5]
end
