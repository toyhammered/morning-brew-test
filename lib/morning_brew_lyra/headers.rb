module MorningBrewLyra
  module Headers
    def default_headers
      {
        Authorization: "Bearer #{ENV['MORNING_BREW_LYRA_API_TOKEN']}"
      }
    end
  end
end
