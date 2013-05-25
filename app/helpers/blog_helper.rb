module BlogHelper

  def markdown(text)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      nowrap:true
    }
    Redcarpet::Markdown.new(HTMLwithPygments, options).render(text).html_safe
  end

end
