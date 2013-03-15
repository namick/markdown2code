require 'redcarpet'
require 'markdown2code/version'

module Redcarpet
  module Render
    class Code < Base
      def paragraph(text)
        "# #{text}\n\n"
      end

      def block_code(code, language)
        "#{code}"
      end

      def linebreak
        "\n"
      end

      def header(text, level)
        hashes = ''
        level.times {hashes += "#"}
        "# #{hashes} #{text} #{hashes}\n\n"
      end
    end
  end
end

module Markdown2code
  def self.render(text)
    renderer = Redcarpet::Render::Code
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    markdown.render(text)
  end
end
