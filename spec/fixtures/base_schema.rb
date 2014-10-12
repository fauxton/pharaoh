module BaseSchema
  def self.schema
    {
      "$schema" => "http://json-schema.org/draft-04/hyper-schema",
      "title" => "Example API",
      "description" => "An example API.",
      "type" => [
        "object"
      ],
      "definitions" => {},
      "properties" => {},
      "links" => [
        {
          "href" => "http://example.com",
          "rel" => "self"
        }
      ],
      "required" => [],
    }
  end
end
