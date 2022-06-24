require 'delegate'

module WithPartial
  class Decorator < ::SimpleDelegator # rubocop:disable Style/Documentation
    def with_context(context)
      dup.tap do |d|
        d.send(:context=, context)
      end
    end

    def with_partial(partial)
      dup.tap do |d|
        d.send(:partial=, partial)
      end
    end

    def to_partial_path
      return __getobj__.to_partial_path unless context.present? || partial.present?

      path_segments.join('/')
    end

    private

    attr_accessor :context, :partial

    def obj_path_segements
      if partial.present?
        __getobj__.to_partial_path.split('/').slice(0...-1)
      else
        __getobj__.to_partial_path.split('/')
      end
    end

    def path_segments
      [
        context,
        obj_path_segements,
        partial
      ].flatten.compact
    end
  end
end