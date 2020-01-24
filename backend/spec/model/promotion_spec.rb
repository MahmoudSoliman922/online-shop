# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Promotion do
  context 'Model Validation' do
    describe 'blank validation' do
      it { should validate_presence_of(:code) }
      it { should validate_presence_of(:discount) }
    end
    describe 'duplicate data' do
      it { should validate_uniqueness_of(:code) }
    end

    describe 'associations' do
      it { should have_many(:product_promotions) }
      it { should have_many(:products).through(:product_promotions) }
    end
  end
end
