# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :state
  searchkick word_middle: %i[name shortname state_name state_shortname]

  validates :name, :shortname, presence: true

  def search_data
    attributes.merge(
      name: name,
      shortname: shortname,
      state_name: state_name,
      state_shortname: state_shortname
    )
  end

  delegate :name, to: :state, prefix: true

  delegate :shortname, to: :state, prefix: true
end
