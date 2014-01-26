module ApplicationHelper
  def full_title(extension)
    base_title = "LetMeGolf"
    if extension.empty?
      full_title = base_title
    else
      return "#{base_title} ~ #{extension}"
    end
  end

  def pretty_list ary
    return ary.first if ary.length == 1
    ary[0...-1].join(', ') + " and #{ary.last}"
  end

end
