require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  #Controversiality is a 0-5 scale
  test "#calculate_controversiality" do
    @user = User.create!(:name => 'test', :password => 'somepassword')
    @beer = Beer.create!(
      :brewery => Brewery.create!(:name => 'test'),
      :name => 'a beer',
      :style =>  nil,
      :abv =>  nil,
      :hops =>  nil,
      :ibu =>  nil,
      :location =>  nil,
      :details =>  nil,
      :average_rating => 3.0)

    assert_equal(0.0, @beer.reload.controversiality)

    # Ignores 3's....
    10.times do
      @user.drinks.create!(:beer => @beer, :rating => 3, :volume => 125)
    end
    assert_equal(0.0, @beer.reload.controversiality)
    Drink.destroy_all

    # Needs data to compare....
    2.times do
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 1, :volume => 125)
    end
    assert_equal(0.0, @beer.reload.controversiality)
    Drink.destroy_all

    # Equal counts are super controversial.
    3.times do
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 1, :volume => 125)
    end
    assert_equal(5.0, @beer.reload.controversiality)
    Drink.destroy_all

    # Unequal counts are relatively biased
    3.times do
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 1, :volume => 125)
    end
    assert_equal(1.0, @beer.reload.controversiality)
    Drink.destroy_all

    # 3's water down the controversy
    3.times do
      @user.drinks.create!(:beer => @beer, :rating => 5, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 1, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 3, :volume => 125)
      @user.drinks.create!(:beer => @beer, :rating => 3, :volume => 125)
    end
    assert_equal(2.5, @beer.reload.controversiality)
    Drink.destroy_all
  end
end
