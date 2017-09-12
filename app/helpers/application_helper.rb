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

# The full_title method is automagically available in all our views.

  #helper method that makes use of that variable @active to highlight the current page.
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

end
