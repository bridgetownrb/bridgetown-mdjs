# frozen_string_literal: true

module BridgetownMdjs
  class Builder < Bridgetown::Builder
    def build
      liquid_tag "sample_plugin" do
        "This plugin works!"
      end
    end
  end
end

class BridgetownMdjs
  class Builder < Bridgetown::Builder
    def build
      method(:process_extractions).tap do |m|
        liquid_tag "mdjs_script" do |_attributes, tag|
          m.(tag.context.registers[:page][:markdown_extractions])
        end
        helper "mdjs_script", helpers_scope: true do
          m.(view.page.data.markdown_extractions)
        end
      end
    end

    def process_extractions(extractions)
      jscode = +""

      extractions&.each do |extraction|
        jscode << extraction.code if (extraction.lang == "js") && (extraction.meta == "script")
      end

      if jscode.present?
        <<~HTML
          <script type="module">
          #{jscode}</script>
        HTML
      else
        ""
      end
    end
  end
end

BridgetownMdjs::Builder.register
