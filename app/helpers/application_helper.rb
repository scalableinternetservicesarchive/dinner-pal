module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Dinnerpal"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def header(text)
    content_for(:header) { text.to_s }
  end
end
