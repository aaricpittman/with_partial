RSpec.describe WithPartial do
  class ModelClass
    include ActiveModel::Model
  end

  class RefinedClass
    using WithPartial

    def test_with_context(model)
      model.with_context("admin")
    end

    def test_with_partial(model)
      model.with_partial("partial")
    end
  end

  class UnrefinedClass
    def test_with_context(model)
      model.with_context("admin")
    end

    def test_with_partial(model)
      model.with_partial("partial")
    end
  end

  context "with in the context of a refined class" do
    let (:model) { ModelClass.new }
    let (:subject) { RefinedClass.new }

    it "should not raise an undefined method exception" do
      expect {
        subject.test_with_context(model)
      }.to_not raise_error

      expect {
        subject.test_with_partial(model)
      }.to_not raise_error
    end
  end

  context "outside the context of a class including WithPartial" do
    let (:model) { ModelClass.new }
    let (:subject) { UnrefinedClass.new }

    it "should raise an undefined method exception" do
      expect {
        subject.test_with_context(model)
      }.to raise_error(NoMethodError)

      expect {
        subject.test_with_partial(model)
      }.to raise_error(NoMethodError)
    end
  end
end