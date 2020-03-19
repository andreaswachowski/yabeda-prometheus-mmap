# frozen_string_literal: true

require "prometheus/client"
require 'rack'
require 'prometheus/client/rack/collector'
require 'prometheus/client/rack/exporter'
require "yabeda/base_adapter"

module Yabeda
  class Prometheus::Mmap::Adapter < BaseAdapter
    class UndeclaredMetricTags < RuntimeError
      attr_reader :message

      def initialize(metric_name, caused_exception)
        @message = <<~MESSAGE.strip
          Prometheus requires all used tags to be declared at metric registration time. \
          Please add `tags` option to the declaration of metric `#{metric_name}`. \
          Error: #{caused_exception.message}
        MESSAGE
      end
    end

    def registry
      @registry ||= ::Prometheus::Client.registry
    end

    def register_counter!(metric)
      validate_metric!(metric)
      registry.counter(build_name(metric), metric.comment)
    end

    def perform_counter_increment!(metric, tags, value)
      registry.get(build_name(metric)).increment(tags, value)
    end

    def register_gauge!(metric)
      validate_metric!(metric)
      raise 'not implemented'
    end

    def perform_gauge_set!(metric, tags, value)
      raise 'not implemented'
    end

    def register_histogram!(metric)
      raise 'not implemented'
    end

    def perform_histogram_measure!(metric, tags, value)
      raise 'not implemented'
    end

    def build_name(metric)
      [metric.group, metric.name, metric.unit].compact.join('_').to_sym
    end

    def validate_metric!(metric)
      return if metric.comment

      raise ArgumentError, 'Prometheus require metrics to have comments'
    end

    Yabeda.register_adapter(:'prometheus-mmap', new)
  end
end
