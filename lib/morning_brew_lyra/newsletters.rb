require_relative 'newsletters/urls'
require_relative 'headers'
require_relative 'responses'

module MorningBrewLyra
  module Newsletters
    extend Responses
    extend Headers
    extend Urls

    class << self
      def all
        response = Typhoeus.get(newsletter_url, headers: default_headers)
        validate_response(response)
        format_response(response)
      end

      def find(id)
        response = Typhoeus.get(find_url(id), headers: default_headers)
        validate_response(response)
        format_response(response)
      end

      def create(date, html)
        response = Typhoeus.post(
          newsletter_url,
          body: {
            date: date,
            html: html
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

      def publish(newsletter, stories)
        template = TemplateBuilder.new(newsletter: newsletter, stories: stories)
        formatted = template.generate_newsletter

        create(newsletter.release_date, formatted)
      end
    end
  end
end
