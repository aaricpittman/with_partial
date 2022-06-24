RSpec.describe WithPartial::Decorator do
  class TestModel
    include ActiveModel::Model
  end

  let(:model) { TestModel.new }

  describe "#to_partial_path" do
    context "context and partial are nil" do
      let(:subject) { described_class.new(model) }

      it "should return the underlying objects to_partial_path" do
        expect(subject.to_partial_path).to eq(model.to_partial_path)
      end
    end

    context "context is specified" do
      let(:subject) { described_class.new(model).with_context("admin") }

      it "should return the underlying objects to_partial_path prepend by the context" do
        expect(subject.to_partial_path).to eq("admin/test_models/test_model")
      end
    end

    context "partial is specified" do
      let(:subject) { described_class.new(model).with_partial("list_item") }

      it "should return the underlying objects to_partial_path with the final segment replaced with the provide partial" do
        expect(subject.to_partial_path).to eq("test_models/list_item")
      end
    end

    context "both context and partial are specified" do
      let(:subject) do
        described_class
          .new(model)
          .with_context("admin")
          .with_partial("gallery_item")
      end

      it "should return the appropriate partial path" do
        expect(subject.to_partial_path).to eq("admin/test_models/gallery_item")
      end
    end
  end

  describe "#with_context" do
    let(:subject) { described_class.new(model) }

    it "returns a new instance of the decorator" do
      result = subject.with_context("admin")

      expect(result).not_to eq(subject)
      expect(result.to_partial_path).not_to eq(subject.to_partial_path)
    end
  end

  describe "#with_partial" do
    let(:subject) { described_class.new(model) }

    it "returns a new instance of the decorator" do
      result = subject.with_partial("card")

      expect(result).not_to eq(subject)
      expect(result.to_partial_path).not_to eq(subject.to_partial_path)
    end
  end
end
