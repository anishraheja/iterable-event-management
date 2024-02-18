class ApplicationService
  include HTTParty
  include Logger

  def self.call(*args, &block)
    new(*args, &block).call
  end

  private

  def send_failure_notification_to_admin
    SendEmailNotification.call(email: 'anishraheja21@gmail.com')
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end

  def get_url(enpoint_url) 
    ENV['ITERABLE_BASE_URL'] + enpoint_url
  end

  def with_error_handling
    yield
    write_success_log('Request was successful')
  rescue StandardError => error
    write_failure_log("Request failed: #{error}")
    send_failure_notification_to_admin
  end
end
