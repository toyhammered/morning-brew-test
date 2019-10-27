require_relative 'stories/urls'
require_relative 'headers'
require_relative 'responses'

module MorningBrewLyra
  module Stories
    extend Responses
    extend Headers
    extend Urls

    class << self
      def all
        response = Typhoeus.get(story_url, headers: default_headers)
        validate_response(response)
        format_response(response)
      end

      def find(id)
        response = Typhoeus.get(find_url(id), headers: default_headers)
        validate_response(response)
        format_response(response)
      end

      def create(story)
        response = Typhoeus.post(
          story_url,
          body: {
            title: story.title,
            html: TemplateBuilder.new(stories: story).generate_story
          },
          headers: default_headers
        )

        validate_response(response)
        format_response(response)
      end

      def update(id, title: nil, html: nil)
        # holding off because more complicated due to being created on the fly
      end

      def destroy(id)
        response = Typhoeus.delete(destroy_url(id), headers: default_headers)
        validate_response(response)
        format_response(response)
      end
    end
  end
end
