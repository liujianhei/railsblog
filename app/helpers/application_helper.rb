module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html:true, hard_wrap:true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks:true, autolink:true,space_after_headers:true,tables:true)
    syntax_highlighter(markdown.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

end
