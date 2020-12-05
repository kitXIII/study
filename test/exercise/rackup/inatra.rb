module Inatra
  HTTP_VERBS = %w[HEAD GET POST PUT PATCH DELETE].freeze
  DEFAULT_NOT_FOUND_ERROR_RESPONSE = [404, { 'Content-Type' => 'text/plain' }, ['Not Found']].freeze
  DEFAULT_SERVER_ERROR_RESPONSE = [500, { 'Content-Type' => 'text/plain' }, ['Internal Server Error']].freeze

  class << self
    def handlers
      @handlers ||= Hash.new { |h, k| h[k] = {} }
    end

    def method_missing(method_name, *args, &block)
      normalized_method_name = method_name.to_s.upcase
      path = args[0]

      super unless HTTP_VERBS.include? normalized_method_name

      raise "Path isn't string in #{method_name} method" unless path.is_a? String
      raise "Block is required in #{method_name} method" unless block_given?

      handlers[normalized_method_name][path] ||= block
    end

    def respond_to_missing?(method_name, include_private = false)
      (HTTP_VERBS.include? method_name.to_s.upcase) || super
    end

    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      handler = handlers[env['REQUEST_METHOD']][env['PATH_INFO']]

      return DEFAULT_NOT_FOUND_ERROR_RESPONSE unless handler

      begin
        handler.call(env)
      rescue RuntimeError => _e
        DEFAULT_SERVER_ERROR_RESPONSE
      end
    end
  end
end
