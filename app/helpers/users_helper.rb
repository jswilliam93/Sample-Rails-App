module UsersHelper

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = "7738f5d527a4da1ddd5f13799b418679"
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
