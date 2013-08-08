module ApplicationHelper

  def friendly_username(drink, current_user)
    drink.user == current_user ? "You" : drink.user.name
  end
end
