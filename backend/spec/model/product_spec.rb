# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  context 'Model Validation' do
    describe 'blank validation' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:price) }
    end
    describe 'duplicate data' do
      it { should validate_uniqueness_of(:name) }
    end

    describe 'associations' do
      it { should belong_to(:departement) }
      it { should have_many(:product_promotions) }
      it { should have_many(:promotions).through(:product_promotions) }
    end
  end
end
