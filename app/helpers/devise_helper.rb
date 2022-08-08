# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return if (flash.notice.blank? && flash.alert.blank?) || flash.notice =~ /signed out/i
    return notice_msg.html_safe if flash.notice
    return alert_msg.html_safe if flash.alert
  end

  def alert_msg
    <<-HTML
    <div>
      <div>
        <h3>#{flash.alert}</h3>
      </div>
    </div>
    HTML
  end

  def notice_msg
    <<-HTML
      <div>
        <div>
          <h3>#{flash.notice}</h3>
        </div>
      </div>
    HTML
  end
end
