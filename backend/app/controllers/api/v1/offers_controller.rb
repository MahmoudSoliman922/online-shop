# frozen_string_literal: true

module Api
  module V1
    class OffersController < ApplicationController
      def index
        response = OfferExecuter.new.index
        render_json(response)
        end

      def paginated_index
        response = OfferExecuter.new.paginated(params[:page])
        render_json(response)
      end

      def paginated_filter
        response = OfferExecuter.new.filter(Offers::Validation.new(filter_params),filter_params, params[:page])
        render_json(response)
      end

      private

      def filter_params
        params.permit(:departement, :promotion_active)
        end
    end
  end
end
