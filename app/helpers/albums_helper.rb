module AlbumsHelper
  def average_rating(album)
    return "No ratings yet" if album.reviews.empty?
    avg = album.reviews.average(:rating).to_f
    "#{avg.round(1)}/5.0"
  end

  def popularity_badge_class(score)
    return "bg-secondary" unless score
    if score >= 90
      "bg-success"
    elsif score >= 70
      "bg-primary"
    else
      "bg-warning"
    end
  end
end
