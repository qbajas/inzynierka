module LearnHelper

  # filter words from the text, or bold them
  def filter(text, expression, hidden = true)
    if hidden
      # filter
      replacement = " "
      expression.size.times { replacement << '. ' }
      text.gsub(expression, replacement)
    else
      # bold
      text.gsub(expression, "<b>#{expression}</b>")
    end
  end


  # fills guess box with first letter or empty string
  def show_first_letter(show, expression)
    if show
      expression.name.first
    else
      ""
    end
  end

end
