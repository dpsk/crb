class BooleanInput < SimpleForm::Inputs::BooleanInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end

  def label_input
    (options[:label] == false ? "" : label) + input
  end
end