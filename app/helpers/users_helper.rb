module UsersHelper

  def gravatar_for(user)
    gravatar_id = "7738f5d527a4da1ddd5f13799b418679"
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
