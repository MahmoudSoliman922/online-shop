# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductPromotion do
  context 'Model Validation' do
    describe 'associations' do
      it { should belong_to(:product) }
      it { should belong_to(:promotion) }
    end
  end
end
