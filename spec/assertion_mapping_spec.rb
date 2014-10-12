require "spec_helper"
require "ostruct"
require_relative "../lib/pharaoh/assertion_mapping"

describe AssertionMapping do
  let(:parsed_schema) { JsonSchema.parse(schema) }

  context "schema properties are mapped:" do
    subject(:mapped_result){ AssertionMapping.new(schemata: parsed_schema, adapter: mock_adapter).mapped_result }

    context "optional" do
      context "integer" do
        let(:schema) { optional_property("foo", "integer") }
        it { expect(mapped_result).to eq({"foo" => :integer_or_null}) }
      end
      context "boolean" do
        let(:schema) { optional_property("foo", "boolean") }
        it { expect(mapped_result).to eq({"foo" => :boolean_or_null}) }
      end
      context "string" do
        let(:schema) { optional_property("foo", "string") }
        it { expect(mapped_result).to eq({"foo" => :string_or_null}) }
      end
      context "object" do
        let(:schema) { optional_property("foo", "object") }
        it { expect(mapped_result).to eq({"foo" => :object_or_null}) }
      end
      context "array" do
        let(:schema) { optional_property("foo", "array") }
        it { expect(mapped_result).to eq({"foo" => :array_or_null}) }
      end
    end

    context "required" do
      context "integer" do
        let(:schema) { required_property("foo", "integer") }
        it { expect(mapped_result).to eq({"foo" => :integer}) }
      end
      context "boolean" do
        let(:schema) { required_property("foo", "boolean") }
        it { expect(mapped_result).to eq({"foo" => :boolean}) }
      end
      context "string" do
        let(:schema) { required_property("foo", "string") }
        it { expect(mapped_result).to eq({"foo" => :string}) }
      end
      context "object" do
        let(:schema) { required_property("foo", "object") }
        it { expect(mapped_result).to eq({"foo" => :object}) }
      end
      context "array" do
        let(:schema) { required_property("foo", "array") }
        it { expect(mapped_result).to eq({"foo" => :array}) }
      end
    end
  end

  def optional_property(property, type)
    merge_property(property, type, required: false)
  end

  def required_property(property, type)
    merge_property(property, type, required: true)
  end

  def merge_property(property, type, required:)
    schema = base_schema.merge(
      { "properties" => {
          "foo" => {
            "type" => type
          },
        }
      }
    )
    schema.merge!({ "required" => [property] }) if required
    schema
  end

  def base_schema
    BaseSchema.schema
  end

  def mock_adapter
    {
      integer: {
        required: :integer,
        optional: :integer_or_null
      },
      boolean: {
        required: :boolean,
        optional: :boolean_or_null
      },
      string: {
        required: :string,
        optional: :string_or_null
      },
      object: {
        required: :object,
        optional: :object_or_null
      },
      array: {
        required: :array,
        optional: :array_or_null
      },
    }
  end
end
