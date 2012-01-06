module LearnHelper

  def filter(text,expression)
    replacement = " "
    expression.size.times{ replacement << '. '}
    text.gsub(expression, replacement)
  end

end
