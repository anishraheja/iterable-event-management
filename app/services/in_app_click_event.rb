class InAppClickEvent < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    with_error_handling do
      url = get_url(ENV['ITERABLE_IN_APP_CLICK_ENDPOINT'])
      response = HTTParty.post(url, headers: headers)
    end
  end
end
