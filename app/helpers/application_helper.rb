module ApplicationHelper
  FLASH_TYPE = { alert: 'danger', notice: 'primary' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    html = flash.map do |key, message|
      content_tag :div, message, class: "alert alert-#{FLASH_TYPE[key.to_sym]}"
    end
    safe_join(html, '')
  end
end
