# frozen_string_literal: true

class State < ApplicationRecord
  has_many :cities, dependent: :destroy

  validates :name, :shortname, presence: true
end
