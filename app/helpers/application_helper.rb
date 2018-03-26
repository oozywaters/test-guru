module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    html = flash.map do |key, message|
      content_tag :p, message, class: "flash #{key}"
    end
    safe_join(html, '')
  end
end
