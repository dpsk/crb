class NumericInput < SimpleForm::Inputs::NumericInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end
end