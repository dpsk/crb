class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end
end