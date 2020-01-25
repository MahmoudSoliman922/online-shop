# frozen_string_literal: true

module Offers
  class Validation
    def initialize(filters)
      @filters = filters

      @errors = []
    end

    def validate
      validate_filters
      self
    end

    private

    def validate_filters
      if !@filters['departement'].blank?
        @errors << 'Departement should be string' unless @filters['departement'].is_a?(String) 

      elsif !@filters['promotion_active'].blank?
        @errors << 'Promotion status should be boolean' unless is_bool(@filters['promotion_active']) 
      end
    end

    def is_bool(ob)
        r = false
        if ['true', 'false'].include? ob
            r = true
        end
        r
    end
  end
end
