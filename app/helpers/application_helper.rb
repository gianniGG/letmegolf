module ApplicationHelper
  def full_title(extension)
    base_title = "LetMeGolf"
    if extension.empty?
      full_title = base_title
    else
      return "#{base_title} o/ #{extension}"
    end
  end
end
