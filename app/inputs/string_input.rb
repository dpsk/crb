class StringInput < SimpleForm::Inputs::StringInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end
end