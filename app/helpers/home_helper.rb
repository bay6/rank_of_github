module HomeHelper
  def gravatar_url(gravatar_id=nil)
    "http://www.gravatar.com/avatar/#{gravatar_id}"
  end
end
