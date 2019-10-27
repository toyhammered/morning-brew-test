module MorningBrewLyra
  module Newsletters
    module Urls
      def find_url(id)
        "#{newsletter_url}/#{id}"
      end
      alias destroy_url find_url
      alias update_url find_url

      def newsletter_url
        "#{base_url}newsletters"
      end

      def base_url
        'https://lyra-api.herokuapp.com/api/'
      end
    end
  end
end
