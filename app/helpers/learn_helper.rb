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

end
