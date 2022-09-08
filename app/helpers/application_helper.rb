# frozen_string_literal: true

require 'redcarpet'

module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

  private

  def user_admin?
    current_user.admin? if current_user.present?
  end

  def user_authorized?
    current_user.authorized? || current_user.admin? if current_user.present?
  end
end
