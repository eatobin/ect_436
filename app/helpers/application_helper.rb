module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'EAT ECT 436'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Renders a header if not home page
  def render_header_conditionally(page_title)
    unless page_title.empty?
      render(:partial => 'layouts/header')
    end
  end

  # Sets focus on page load
  def set_focus_to_id(id)
    javascript_tag("$('#{id}').focus()")
  end
end
