module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "UMarket"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

# The full_title method is automagically available in all our views.
