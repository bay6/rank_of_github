module HomeHelper
  def gravatar_image gravatar_id=nil
    url = "http://www.gravatar.com/avatar/#{gravatar_id}"
    image_tag url, size: "80*80", alt: "头像"
  end

  def user_url username
    "https://www.github.com/#{username}"
  end

  def ranking_number pagenumber
    1
  end

  def perv_url
    number = params[:page] - 1 if params[:page]
    "/" + number.to_s
  end

  def next_url
    number = params[:page] + 1 if params[:page]
    "/" + number.to_s
  end
end
