module MorningBrewLyra
  module Stories
    module Urls
      def find_url(id)
        "#{story_url}/#{id}"
      end
      alias destroy_url find_url
      alias update_url find_url

      def story_url
        "#{base_url}stories"
      end

      def base_url
        'https://lyra-api.herokuapp.com/api/'
      end
    end
  end
end
