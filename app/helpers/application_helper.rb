module ApplicationHelper

  # Method to set focus on item (usually first text field)
  def set_focus_to_id(id)
    javascript_tag("$('#{id}').focus()");
  end

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "HBSC Puma"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
