module WithPartial # rubocop:disable Style/Documentation
  module Conversions
    def with_context(context)
      WithPartial::Decorator
        .new(self)
        .with_context(context)
    end

    def with_partial(partial)
      WithPartial::Decorator
        .new(self)
        .with_partial(partial)
    end
  end
end