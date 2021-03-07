module ApplicationHelper
  # タイトル
  def full_title(page_title = '')
    base_title = "Welcome to My Portfolio - 私が担当・制作させて頂いたWebサイトのご紹介"
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
