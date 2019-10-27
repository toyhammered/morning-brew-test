module MorningBrewLyra
  class TemplateBuilder

    def initialize(newsletter: nil, stories: nil)
      @newsletter = newsletter
      @stories = Array.wrap(stories)
    end

    def generate_newsletter
      raise 'Newsletter required' if @newsletter.blank?

      builder = Nokogiri::HTML::Builder.new do |doc|
        doc.html {
          doc.body {
            doc.h1 { doc.text @newsletter.title }
            doc.h2 { doc.text "Date: #{@newsletter.release_date}" }

            generate_stories do |story|
              doc << story
            end
          }
        }
      end

      format_html(builder)
    end

    def generate_story
      builder = Nokogiri::HTML::Builder.new do |doc|
        generate_stories do |story|
          doc << story
        end
      end

      format_html(builder)
    end

    def generate_stories
      @stories.each do |story|
        title = story.title
        tag = story.tag
        html = Nokogiri::HTML.fragment(story.body)

        builder = Nokogiri::HTML::Builder.new do |doc|
          doc.table(class: '', width: '100%', cellpadding: '0', cellspacing: '0', border: '0', style: 'border-collapse: collapse;') {
            doc.tr {
              doc.td(class: 'tag-outer') {
                doc.table(align: 'left', cellpaddind: '0', cellspacing: '0', border: '0', style: 'display: inline-block; border-collapse: collapse;') {
                  doc.tr {
                    doc.td(class: 'inner-tag', style: 'color: #ffffff') {
                      doc.text tag
                    }
                  }
                }

                doc.h1(color: '#000000') {
                  doc.text title
                }

                doc.div {
                  doc.text story.body
                }
              }
            }
          }
        end

        yield builder.doc.root.to_html
      end
    end

    private

    def format_html(builder)
      builder.doc.root.to_html.gsub('&lt;', '<').gsub('&gt;', '>')
    end
  end
end
