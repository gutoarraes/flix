module ReviewsHelper
  def stars_as_percent(review)
    (review.stars / 5.0) * 100.0
  end
end
