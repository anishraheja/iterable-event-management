module Logger
  class <<self
    attr_reader :logger

    def initialize_log
      @logger ||= Logger.new(STDOUT)
    end

    def write_success_log(log_message)
      initialize_log
      logger.info { "#{log_message}" }
    end

    def write_failure_log(log_message)
      initialize_log
      logger.error { "#{log_message}" }
    end
  end
end
