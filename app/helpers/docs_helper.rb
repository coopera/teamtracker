module DocsHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    @coderayified ||= CodeRayify.new(:filter_html => true,
                               :hard_wrap => true)

    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }

    @markdown_to_html = Redcarpet::Markdown.new(@coderayified, options)
    @markdown_to_html.render(text).html_safe
  end

  def pretty_tag(tag)
    tag[0] + " | " + tag[1].to_i.to_s
  end
end
