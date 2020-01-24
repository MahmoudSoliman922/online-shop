# frozen_string_literal: true

module Api
  module V1
    class OffersController < ApplicationController
      def index
        response = GeneralExecuter.new(Offer).index(OffersSerializer)
        render_json(response)
        end

      #   def index
      #     response[:@errors] = nil
      #     response[:@response] = get_serlized_array(OfferView.all, OffersSerializer)
      #     render_json(response)
      #     # should return all the offers from the view
      #   end

      def paginated_index
        # should return the offers by page
      end

      def paginated_filter
        # should return the offers by page after applying the required filters
      end

      private

      def get_serlized_array(arr, serializer)
        ActiveModelSerializers::SerializableResource.new(
          arr,
          each_serializer: serializer
        )
        end

      def axis_params
        params.require(:axis).permit(:ar_name, :en_name, :code,
                                     :en_description, :ar_description, :disabled,
                                     :group_id, :route_id)
        end
    end
  end
end
