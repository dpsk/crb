class PasswordInput < SimpleForm::Inputs::PasswordInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end
end