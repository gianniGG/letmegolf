def full_title(extension)
  base_title = "LetMeGolf"
  if extension.empty?
    full_title = base_title
  else
    return "#{base_title} ~ #{extension}"
  end
end