class UserSession

  attr_accessor :name
  attr_reader   :user

  def initialize(params = {})
    self.name = params[:name]
  end

  def id
    user.id
  end

  def errors
    user.errors
  end

  # returns true or false if we can find a valid user to login
  def login!
    if self.user = User.find_by_name(name)
      user.password_less?
    else
      self.user = User.new(:name => name)
      user.save
    end
  end

  protected
  def user=(user)
    @user = user
  end
end
