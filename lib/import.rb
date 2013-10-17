class Import
  require 'csv'
  
  def initialize
    Drink.delete_all
    Beer.delete_all
    Brewery.delete_all
    
    CSV.foreach(Rails.root.to_s + "/db/beers.csv") do |row|
      next if row.first == 'Brewery' # skip header row
      
      (brewery_name, beer_name, abv) = row
      
      Beer.create(
        :brewery => Brewery.where(:name => brewery_name).first_or_create,
        :name => beer_name,
        :abv => abv.present? ? abv.to_f : nil,
        :average_rating => 3.0
      )
      
      # beers.each do |beer_or_brewery|
      #   if beer_or_brewery[0..1] != "  "
      #     brewery_name = beer_or_brewery
      #     @current_brewery = Brewery.create!(:name => brewery_name)
      #   else
      #     name, abv, ibu = beer_or_brewery[2..-1].split(", ")
      #     beer = Beer.new(:name => name,
      #                  :brewery => @current_brewery)
      #     beer.abv = abv if abv
      #     beer.ibu = ibu[3..-1] if ibu
      #     beer.save!
      #   end
      # end

    end
  end
end