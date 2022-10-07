# frozen_string_literal: true

require 'redcarpet'

module ApplicationHelper
  def markdown(text)
    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end
end
