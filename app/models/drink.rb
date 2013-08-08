class Drink < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  validates_presence_of :volume
  
  def before_save
    self.session = 1 # todo - implement session numbering
  end
  
end
