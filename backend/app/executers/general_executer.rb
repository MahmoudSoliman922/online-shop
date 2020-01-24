class GeneralExecuter
  def initialize(model)
    super()
    @model = model

    @response = []
    @errors = []
  end

  def index(serializer)
    @response = get_serlized_array(@model.all, serializer)
    self
  rescue StandardError => e
    @errors << e
  end

  def get_serlized_array(arr, serializer)
    ActiveModelSerializers::SerializableResource.new(
      arr,
      each_serializer: serializer
    )
  end
end
