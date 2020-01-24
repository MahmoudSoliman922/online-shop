# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Departement do
  context 'Model Validation' do
    describe 'blank validation' do
      it { should validate_presence_of(:name) }
    end
    describe 'duplicate data' do
      it { should validate_uniqueness_of(:name) }
    end

    describe 'associations' do
      it { should have_many(:products) }
    end
  end
end
