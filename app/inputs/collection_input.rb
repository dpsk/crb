class CollectionInput < SimpleForm::Inputs::CollectionInput
  def input
    "<div class=\"input\">#{super}</div>".html_safe
  end
end