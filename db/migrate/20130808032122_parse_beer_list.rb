class ParseBeerList < ActiveRecord::Migration
  def up
beers = "8Wired Brewing
  Superconductor DIPA, 8.9%, BU 88
  Hopwired IPA, 7.3%, BU 70
  Tall Poppy Red, 7.0%, BU 60
  iStout Imperial Stout, 10.0%, BU 75
  Mighty Imperial Ale, 10.0%, BU 75
  Semiconductor Session IPA, 4.4% BU 30
Adnams
  Southwold Bitter, 4.1%
  Broadside (Premium Bitter), 6.3%
  Explorer (East Coast Blonde Beer), 5.0%
  Ghost Ship PA, 4.5%
  Gunhill, 4.0%
  Innovation IPA, 6.7%
Belgian Specialty
  Leffe Blonde, 6.5%
  Leffe Brun, 6.5%
  Stella Artois, 5.0%
  Hoegaarden, 4.8%
Black Dog Brewery
  Golden Lab (Golden Ale), 4.8%, BU 30
  Chomp (NZ Pale Ale), 4.8%, BU 30
  Clifford (Red IPA), 6.5%, BU 60
  Unleashed Citra (APA), 6.3%, BU 65
  Pango Kuri (American style Stout), 6.2%, BU 45
  Bite (Pilsner), 5.5%, BU 35
Boundary Road Brewery
  Einstein Munich Lager, 5.3%, BU 23
  Red Baron Red Ale, 5.6%, BU 40
  18th Amendment APA, 6.0% BU 38
  Stolen Base Double IPA, 8.0%, BU 65
  Jack The Sipper London Porter, 5.6%, BU 30
  Arabica Dabra Coffee Oat Stout, 6.5%, BU 30
Brewdog
  Punk IPA, 5.6%, BU 45
  Hardcore IPA, 9.2%, BU 150
  5am Saint, 5.0%, BU 25
Deep Creek Brewing Co
  Dweller on the Threshold, 7.3%, BU 26
  309, 5.0%, BU 38
  Dominatrix, 7.8%, BU 60
Emerson Brewery
  Pilsner, 4.9%
  Bookbinder, 3.7%
  London Porter, 4.9%
  Regional W&S/EBC Collaboration Brew - Milk Stout, 4.5%
  Brewer’s Reserve Bald Eagle, 7.0%
  Brewer’s Reserve White Tail, 6.0%
  Brewer’s Reserve Jack of all Trades, 4.5%
  Brewer’s Reserve Clean Sweep, 5.2%
Epic Brewing Company
  Epicurean Coffee & Fig Stout 2013, 8.0%, BU 50
  Comet IPA, 6.3%, BU 45
  Armageddon IPA, 6.7%, BU 66
  Lager, 5.0%, BU 25
  Hop Zombie, 8.5%, BU 90
  Pale Ale, 5.4%, BU 45
Fork & Brewer
  Base Isolator (APA), 6.3%
  Bohemian Hipster (Pilsner), 5.0%
  Stormchaser (Dunkelweizen), 4.4%
Founders Brewery
  1946 Pilsner, 5.0%, BU 33
  1903 Red Ale, 5.5%, BU 35-30
  1854 Porter, 5.2%, BU 20-25
  1981 Pale Ale, 2.2%, BU 28
  2009 IPA, 5.3%, BU 32-35
  1921 Stout, 5.5%, BU 30
Garage Project
  Red Rocks Reserve 2013, 7.0%
  Death From Above, 7.5%
  Cà Phê ðá (On Nitro), 5.0%
  Barrel-aged Cherry Bomb, 9.0%
  Smoke & Mirrors, 6.2%
  Sauvin Nouveau, 7.8%
  Cockswain’s Extraordinary Ordinary (Cask conditioned and handpulled), 3.4%
  Spezial K (German pitch barrel, gravity poured), 5.1%
Garage Project Workshop
  Hot Buttered Bastard Rye, 13.0%
  Fire Poker Blended Cockswain’s Courage Porter, 10.5%
  Straight Edge, 0.0%
Good George Brewing
  Belgian Dubbel, 7.5%, BU 22
  Sparkling Ale, 4.5%, BU 21
  Amber Ale, 3.7%, BU 22
  IPA, 5.8%, BU 47
  Drop Hop Cider, 5.0%
  Almost Imperial American IPA, 7.5%, BU 55
Hancock & Co
  Colonial Wheat Ale, 4.9%, BU 20
  Grand Pale Ale, 4.8%, BU 34
  Cardinal Red Ale, 4.4%, BU 26
  Bismarck Brown Ale, 4.8%, BU 24
Harrington’s Breweries
  The Pig & Whistle Mild Dark Ale, 4.0%, BU 30
  Brewers’ Selection Strong Pilsner (Anvil), 6.5%, BU 45
  Brewers’ Selection Belgium Abbey Tripel, 8.8%, BU 38
  Brewers’ Selection Imperial APA, 9.5%, BU 100
  The Rogue Hop Organic Pilsner, 5.0%, BU 45
  Brewers’ Selection IPA, 6.5%, BU 60
James Squire
  Four Wives (Pilsner), 5.0%
  150 Lashes (PA), 4.7%
  Chancer (Golden Ale), 4.5%
  Nine Tales (Amber Ale), 5.0%
  Orchard Crush (Cloudy Apple Cider), 4.8%
Kereru Brewing Company Ltd
  Silverstream Pale Ale, 3.8%, BU 20
  Hop To It Pale Ale, 5.9%, BU 35
  Moonless Stout, 4.2%, BU 25
  Velvet Boot, 8.0%, BU 18
Liberty Brewing
  Oh Brother (Pale Ale), 5.1%, BU 40
  Yakima Monster (Strong Pale Ale), 6.0%, BU 45
  Darkest Days (Oatmeal Stout), 6.0%, BU 45
  Yakima Scarlet (Hoppy Red Ale), 6.9%, BU 50
  Sauvignon Bomb NZ Pale Ale), 7.0%, BU 70
  Citra (Double India Pale Ale), 9.0%, BU 99
Little Creatures
  Pale Ale, 5.2%
  Rogers (Ale), 3.8%
  Pilsner, 4.6%
  Bright Ale, 4.5%
  Mr Obadiah (Porter), 6.9%, BU 55
Mac’s Issacs
  Mac’s Hop Rocker, 5.0%
  Mac’s Great White, 5.0%
  Mac’s Sassy Red, 4.5%
  Mac’s Black, 4.8%
  Mac’s Cascade Parade, 5.5%
  Issac’s Apple Cider, 5.0%
  Issac’s Pear Cider, 5.0%
  Issac’s Berry Cider, 5.0%
McCashin’s Brewery – Stoke
  Cirrus – Wheat Beer, 5.0%, BU 15
  Pacific Northwest – Double PA, 5.7%, BU 40
  Shapeshifter – Doppelbock, 9.4%, BU 22
  Cheeky Dark Porter, 4.6%, BU 32
  Rochdale Lemon Honey Cider, 5.0%
  Arm Twister Imperial Stout, 10.0%, BU20
Monteith’s Brewing Company Ltd
  Ginger & Pear Cider, 5.5%
  Heritage Style Cider, 5.0%
  Barrel Aged Porter, 6.5%, BU 31
  India Pale Ale, 5.5%, BU 35
  Alcoholic Ginger Beer, 4.5%, BU 5
  Apricot Wheat Beer, 5.0%, BU 14
  Imperial Pilsner, 7.0%, BU 45
  Double Hopped IPA, 7.5%, BU 65
Mountain Goat Brewery
  Organic Steam Ale, 4.5%, BU 22
  Hightail Ale, 4.5%, BU 28
  IPA, 6.2%, BU 55
  Hopfweizenbock, 6.5%, BU 40
  RIPA- Ye IPA, 5.7%, BU 50
  Surefoot Stout, 5.0%, BU 35
  Mike’s 3rd Nut, 6.0%, BU 30
Old Mout Cider
  Cranberry & Cider, 5.8%
  Boysencider, 5.8%
  Feijoa & Cider, 5.8%
  Passionfruit & Cider, 5.8%
  Pear Scrumpy, 8.0%
  Scrumpy, 8.0%
  Classic Apple, 4.5%
  Crafty Pear, 4.5%
Panhead Custom Ales
  Port Road Pilsner, 5.2%, BU 40
  Quickchange Xtra Pale Ale, 4.6%, BU 45
  Supercharger American Styled Pale Ale, 5.7%, BU 53
  Black Top Oat Stout, 5.5%, BU 30
  Bitchin IPA, 7.7%, BU 70
ParrotDog
  BitterBitch, 5.8%, BU 70
  Bloodhound, 6.3%, BU 40
  BloodyDingo, 7.7%, BU 85
  DeadCanary, 5.3%, BU 30
  Dogg, 3.9%, BU 20
  FlaxenFeather, 4.7%, BU 25
  PitBull, 7.0%, BU 80
  Otis, 6.3%, BU 30
Samuel Adams
  Boston Lager, 4.9%, BU 30
  Boston Ale, 4.8%, BU 34
  Noble Pilsner, 4.9%, BU 34
Sprig & Fern
  Motueka Pilsner, 5.0%, BU 35
  Berry Cider, 4.5%
  Tasman Lager, 6.5%, BU 22
  Best Bitter, 5.0%, BU 28
  Scotch Ale, 6.5%, BU 25
  Doppelbock, 8.0%, BU 24
Tuatara
  Pilsner, 5.0%, BU 40
  Heffe Wheat Beer, 5.0%, BU 15
  IPA, 5.0%, BU 45
  NZAPA, 6.0%, BU 48
  Double Trouble US P.A, 9.0%, BU 67
  Stout, 7.0%, BU 60
Zeffer Brewing Co
  Dry Apple Cider, 5.0%
  Dry Pear Cider, 5.0%
  Slack MA Girdle Cider, 7.0%
Baylands Brewery Ltd
  Red Rye IPA, 7.0%, BU 65
  ENFORCER Black IPA, 6.0%, BU 5
Brew Moon Brewing Co.
  Hophead IPA, 5.0%
  Olé Molé, 5.0%
Cassel & Sons Brewery
  Milk Stout, 5.3%, BU 25
  One P.A., 6.3%, BU 70
Croucher Brewing
  Nuclear Free ANZUS, 7.0%, BU 70
  Vicar’s Vice, 7.0%, BU 20
Funk Estate
  Oh Lordy! Pale Ale, 5.9%, BU 60
  Funk’nstein Black IPA, 7.0%, BU 76
Regent 58
  IPA, 6.3%, BU 40
  ESB, 5.8%, BU 35
The Leigh Brewing Company Ltd
  Pilsner, 4.5%, BU 27
  12 Gauge Strong Lager, 6.5%, BU 32
Wigram Brewing Company
  Harvard Honey Ale, BU 6.0%
  Mustang Pale Ale, BU 5.0%
Zeelandt Brewing Co
  Kolsch Style, 5.0%, BU 20
  Pale Ale, 5.0%, BU 32
Behemoth Brewing Company Limited
  Celia Wade Coffee Brown Ale, 5.5%, BU 33
Brewaucracy Ltd
  Smoko, 5.0%, BU 30
Dales Brewing
  Dale’s Belgian Pale Ale, 5.4%, BU 26
Invercargill Brewery
  Pitch Black Stout, 4.5%, BU 17
MOA
  Methode, 5.0%, BU 45
Northend Brewing Co
  ESB, 5.3%, BU 40
Renaissance Brewing Ltd
  Stonecutter Scotch Ale, 7.0%, BU 28
Rocky Knob Brewing Company
  Hen Pecked Wheat, 5.4%, BU 30
Shunters Yard Brewing Limited
  No. 7 Pilsner, 5.2%
Steam Brewing Company
  “Return Of The Grumpy Boyz” Porter, 9.0%, BU 100
Sunshine Brewery
  Gisborne Gold, 4.0%, BU 22
Three Boys Brewery
  Oyster Stout, 6.5%, BU 68
Townshend Brewery
  Sutton Hoo, 4.7%, BU 35
Twisted Hop
  Hopback IPA, 5.8%, BU 50
Two Fingers Beers
  Battering Ram-Doppel Alt (Sticke) German style dark ale, 6.5%, BU 50
Two Thumb Brewing Company
  NZ Pale Ale, 5.4%, BU 43
Valkyrie Brewing
  Freyja (California Common), 6.6%, BU 39
Velvet Worm Brewery
  Eye Of Jupiter, 4.8%, BU 50
Yeastie Boys
  Digital IPA, 7.0%, BU 77
Brewcult
  Acid Freaks Balsamic Baltic Porter, 7.5%, BU 30
Bridge Road Brewers
  Bling Bling, 8.5%, BU 50
  Chevalier Saison, 6.0%, BU 30
Burleigh Brewing Co.
  HEF, 5.0%
Feral Brewery
  HopHog, 5.8%, BU 48
  Boris, 11.5%, BU 52
Holgate Brewhouse
  Holgate Temptress, 6.0%
Matilda Bay Brewing
  Alpha Pale Ale, 5.2%, BU 55
Moo Brew
  Seasonal Stout, 8.0%, BU 65
Mur rays
  Grand Cru, 8.8%
  Wild Thing, 10.0%
Nail Brewery
  Clout Stout, 10.6%, BU 63
Stone & Wood Brewing Co
  Pacific Ale, 4.4%, BU 20
The Monk
  Chief, 6.1%, BU 75
Two Birds
  Sunset Ale, 4.6%, BU 30
  Golden Ale, 4.4%, BU 22".split("\n")

  beers.each do |beer_or_brewery|
    puts beer_or_brewery[0..1].inspect
    if beer_or_brewery[0..1] != "  "
      brewery_name = beer_or_brewery
      @current_brewery = Brewery.create!(:name => brewery_name)
    else
      name, abv, ibu = beer_or_brewery[2..-1].split(", ")
      beer = Beer.new(:name => name,
                   :brewery => @current_brewery)
      beer.abv = abv if abv
      beer.ibu = ibu if ibu
      beer.save!
    end
  end
  end

  def down
    # save the beers!
    Beer.all.each do |beer|
      beer.destroy
    end

    Brewery.all.each do |brewery|
      brewery.destroy
    end
  end
end
