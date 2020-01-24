# frozen_string_literal: true

module Api
  module V1
    class OffersController < ApplicationController

        def index
            # should return all the offers from the view
        end

        def paginated_index
            # should return the offers by page 
        end

        def paginated_filter
            # should return the offers by page after applying the required filters
        end
    end
  end
end
