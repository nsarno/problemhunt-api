module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    rescue
      @json = nil
    end
  end
end
