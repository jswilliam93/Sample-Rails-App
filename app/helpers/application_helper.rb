module ApplicationHelper
  def full_tiltle(title = "")
      base_title = "Rails Tutorial"
      if title.empty?
        base_title
      else
        "#{title} | #{base_title}"
      end
  end
end
