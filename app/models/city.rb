class City < ApplicationRecord
  belongs_to :state
  searchkick word_middle: [:name, :shortname, :state_name, :state_shortname]

  validates_presence_of :name, :shortname

  def search_data
    attributes.merge(
      name: name,
      shortname: shortname,
      state_name: self.state_name,
      state_shortname: self.state_shortname
    )
  end

  def state_name
    self.state.name
  end

  def state_shortname
    self.state.shortname
  end

end