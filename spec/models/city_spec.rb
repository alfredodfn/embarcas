require 'rails_helper'

RSpec.describe City, type: :model do

  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:shortname) }

    it 'is valid with name and shortname' do
      city = build(:city)
      city.valid?
      expect(city).to be_valid
    end

    it 'is invalid without name' do
      city = build(:city, name: nil)
      city.valid?
      expect(city.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without shortname' do
      city = build(:city, shortname: nil)
      city.valid?
      expect(city.errors[:shortname]).to include("can't be blank")
    end

    it 'is invalid without state' do
      city = build(:city, state: nil)
      city.valid?
      expect(city.errors[:state]).to include("must exist")
    end

  end

  context 'Associations' do
    it { should belong_to(:state) }
  end

end