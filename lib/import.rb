class Import
  require 'csv'
  
  def initialize
    Drink.delete_all
    Beer.delete_all
    Brewery.delete_all

    csv = IO.readlines(Rails.root.to_s + "/db/new-beers.csv").join
    # csv.encode!('UTF-8', 'ASCII', :invalid => :replace)

    csv.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
    csv.encode!('UTF-8', 'UTF-16')

    CSV.parse(csv) do |row|
      next if row.first == 'name' # skip header row
      
      (beer_name,brewery_name,style,abv,hops,ibu,location,description) = row
      
      Beer.create(
        :brewery => Brewery.where(:name => brewery_name).first_or_create,
        :name => beer_name,
        :style => style.present? ? style : nil,
        :abv => abv.present? ? abv.to_f : nil,
        :hops => hops.present? ? hops : nil,
        :ibu => ibu.present? ? ibu.to_f : nil,
        :location => location.present? ? location : nil,
        :details => description.present? ? description : nil,
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