class SendEmailNotification < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    with_error_handling do
      url = get_url(ENV['ITERABLE_SEND_EMAIL_ENDPOINT'])
      # response = HTTParty.post(url, body: JSON.generate({ foo: 'bar' }), headers: headers)
      response = HTTParty.get(url, headers: headers)
    end
  end
end