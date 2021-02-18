module ApplicationHelper
  # タイトル
  def full_title(page_title = '')
    base_title = "ポートフォリオ"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def locationUrl
    request.url
  end
end
