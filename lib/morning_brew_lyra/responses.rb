module MorningBrewLyra
  module Responses
    def validate_response(response)
      return if response.success?

      if response.timed_out?
       # aw hell no
       p ("got a time out")
      elsif response.code.zero?
       # Could not get an http response, something's wrong.
       p (response.return_message)
      else
       # Received a non-successful http response.
       p ("HTTP request failed: " + response.code.to_s)
      end

      raise response.body
    end

    def format_response(response)
      JSON.parse(response.body)['data']
    end
  end
end
