class State < ApplicationRecord
  has_many :cities

  validates_presence_of :name, :shortname

end