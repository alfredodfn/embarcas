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

  context "searches", search: true do
    it "with name" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "Curitiba", fields: [:name]
      expect(search_results.count).to eq(1)
    end

    it "with shortname" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "CWB", fields: [:shortname]
      expect(search_results.count).to eq(1)
    end

    it "with invalid param" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "abacate", fields: [:name]
      expect(search_results.count).to eq(0)
    end

    it "with partial name" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "Curit", fields: [:name], match: :word_middle
      expect(search_results.count).to eq(1)
    end

    it "with state name" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "Paraná", fields: [:name, :state_name], match: :word_middle
      expect(search_results.count).to eq(1)
    end

    it "with state name misspelling" do
      city = create(:city)
      City.search_index.refresh
      search_results = City.search "Parna", fields: [:name, :state_name], match: :word_middle, misspellings: {edit_distance: 2}
      expect(search_results.count).to eq(1)
    end
  end

end