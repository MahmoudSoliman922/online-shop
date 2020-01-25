class OfferExecuter
  def initialize()
    super()
    @model = Offer
    @serializer = OffersSerializer

    @response = []
    @errors = []
  end

  def index
    @response[:offers] = get_serlized_array(@model.all)
    self
  rescue StandardError => e
    @errors << e
  end

  def paginated(page= 1)
    page ||= 1
    @response = {}
    paginatedOffers = Offer.limit(25).offset((page.to_i-1) * 25)
    @response[:offers] = get_serlized_array(paginatedOffers)
    @response[:page] = page
    self
  rescue StandardError => e
    @errors << e
  end

  def filter(validation, filters, page = 1)
    page ||= 1
    @response = {}
    valid_data = validation.validate
    (@errors.concat valid_data.instance_variable_get(:@errors)) && (return self) unless valid_data.instance_variable_get(:@errors).blank?

    begin
      if filters['departement'].blank?
          filteredOffers = @model.promotion_status(filters['promotion_active']) unless filters['promotion_active'].blank?
      else
        filteredOffers = @model.departement(filters['departement']) unless filters['departement'].blank?
        filteredOffers = filteredOffers.promotion_status(filters['promotion_active']) unless filters['promotion_active'].blank?
      end
      filteredOffers = filteredOffers.limit(25).offset((page.to_i-1) * 25) unless filteredOffers.blank?
      @response[:offers] = get_serlized_array(filteredOffers)
      @response[:page] = page
    rescue StandardError => e
      @errors << e
    end
    self
  end

  def get_serlized_array(arr)
    ActiveModelSerializers::SerializableResource.new(
      arr,
      each_serializer: @serializer
    )
  end
end

