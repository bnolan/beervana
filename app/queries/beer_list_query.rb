class BeerListQuery
  def by_abv
    base_relation.order 'abv DESC'
  end

  def by_name
    base_relation.order 'name'
  end

  def by_controversiality
    base_relation.references(:beer_ratings).order 'beer_ratings.controversiality DESC'
  end

  def by_average_rating
    base_relation.references(:beer_ratings).limit(500).order 'coalesce(beer_ratings.average_rating, 3) DESC'
  end

  private

  def base_relation
    Beer.includes(:brewery, :current_beer_rating)
  end
end
