class Movie < ApplicationRecord
  validates :title, :released_on, :duration, presence: true
  validates :description, length: {minimum:25}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :rating, inclusion: { in: RATINGS}

  has_many :reviews

  def flop?
    total_gross.blank? || total_gross < 225000000
  end

  def released
    Movie.where('released_on < ?',Time.now).order(released_on: :desc)
  end
end
