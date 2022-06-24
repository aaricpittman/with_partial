require "with_partial"

module WithPartial # rubocop:disable Style/Documentation
  module Helpers
    def with_context(obj, context)
      WithPartial::Decorator
        .new(obj)
        .with_context(context)
    end

    def with_partial(obj, partial)
      WithPartial::Decorator
        .new(obj)
        .with_partial(partial)
    end
  end
end

# TODO: figure out how to include WithPartial::Helpers as an application helper