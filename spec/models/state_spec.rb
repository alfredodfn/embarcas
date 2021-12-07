# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(State, type: :model) do
  context 'Validations' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:shortname)) }

    it 'is valid with name and shortname' do
      state = build(:state)
      state.valid?
      expect(state).to(be_valid)
    end

    it 'is invalid without name' do
      state = build(:state, name: nil)
      state.valid?
      expect(state.errors[:name]).to(include("can't be blank"))
    end

    it 'is invalid without shortname' do
      state = build(:state, shortname: nil)
      state.valid?
      expect(state.errors[:shortname]).to(include("can't be blank"))
    end
  end

  context 'Associations' do
    it { is_expected.to(have_many(:cities)) }
  end
end
