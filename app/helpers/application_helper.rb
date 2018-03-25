module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(type)
    content_tag :p, flash[type.to_sym], class: "flash #{type}" if flash[type.to_sym]
  end
end
