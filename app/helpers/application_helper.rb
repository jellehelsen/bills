module ApplicationHelper
  def render_google_analytics?
    !request.local?
  end
end
