# frozen_string_literal: true

module BridgetownMdjs
  class Builder < Bridgetown::Builder
    def build
      # Set the kramdown input to use the extractions parser
      site.config.kramdown.input = "GFMExtractions"

      # Obtain method as a proc and call it from within either the Liquid or Ruby helper contexts
      method(:process_extractions).tap do |process_the|
        liquid_tag "mdjs_script" do |_attributes, tag|
          process_the.(tag.context.registers[:page][:markdown_extractions])
        end
        helper "mdjs_script", helpers_scope: true do
          process_the.(view.page.data.markdown_extractions)
        end
      end
    end

    def process_extractions(extractions)
      jscode = +""

      extractions&.each do |extraction|
        jscode << extraction.code if (extraction.lang == "js") && (extraction.meta == "script")
      end

      if jscode.present?
        return <<~HTML
          <script type="module">
          #{jscode}</script>
        HTML
      end

      jscode
    end
  end
end

BridgetownMdjs::Builder.register
