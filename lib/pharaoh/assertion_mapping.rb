class AssertionMapping
  def initialize(schemata:, adapter:)
    @schemata = schemata
    @adapter = adapter
  end

  def mapped_result
    @schemata.compact.inject({}) do |result, schema|
      schema.properties.each do |property_name, obj|
        type = obj.type.first.to_sym
        required = schema.required.include?(property_name) ? :required : :optional
        result[property_name] = @adapter[type][required]
      end
      result
    end
  end
end
