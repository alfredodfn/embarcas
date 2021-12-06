class City < ApplicationRecord
  belongs_to :state

  validates_presence_of :name, :shortname
end